import 'package:dio/dio.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/injector/modules/dio_module.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/core/keys/app_keys.dart';

class SourceService {
  SourceService._();

  static final SourceService instance = SourceService._();

  final LocalStorageService _localStorage =
      Injector.instance<LocalStorageService>();

  List<Resource> _webResources = [..._defaultWebResources];
  List<Resource> _knowledgeBaseResources = [..._defaultKnowledgeBaseResources];

  Set<String> _selectedWebUris = {};
  Set<String> _selectedKnowledgeBaseUris = {};

  bool _isWebEnabled = true;
  bool _isKnowledgeBaseEnabled = true;

  Future<void>? _ongoingFetch;

  List<Resource> get webResources => _webResources;
  List<Resource> get knowledgeBaseResources => _knowledgeBaseResources;
  Set<String> get selectedWebUris => _selectedWebUris;
  Set<String> get selectedKnowledgeBaseUris => _selectedKnowledgeBaseUris;

  bool get isWebEnabled => _isWebEnabled;
  bool get isKnowledgeBaseEnabled => _isKnowledgeBaseEnabled;

  bool get hasCustomSelection =>
      _selectedWebUris.length != _webResources.length ||
      _selectedKnowledgeBaseUris.length != _knowledgeBaseResources.length ||
      !_isWebEnabled ||
      !_isKnowledgeBaseEnabled;

  void updateSelection({
    Set<String>? webUris,
    Set<String>? knowledgeBaseUris,
    bool? isWebEnabled,
    bool? isKnowledgeBaseEnabled,
  }) {
    if (webUris != null) {
      _selectedWebUris = webUris;
    }
    if (knowledgeBaseUris != null) {
      _selectedKnowledgeBaseUris = knowledgeBaseUris;
    }
    if (isWebEnabled != null) {
      _isWebEnabled = isWebEnabled;
    }
    if (isKnowledgeBaseEnabled != null) {
      _isKnowledgeBaseEnabled = isKnowledgeBaseEnabled;
    }
  }

  /// Resets resources and selection to default state.
  /// Should be called when starting a new chat session.
  void reset() {
    _webResources = [..._defaultWebResources];
    // Note: We might want to keep fetched RAG resources if they are global,
    // but for now resetting to default as per request.
    // If dynamic RAG resources should persist across chats, remove the next line.
    _knowledgeBaseResources = [..._defaultKnowledgeBaseResources];

    _selectedWebUris = {};
    _selectedKnowledgeBaseUris = {};
    _isWebEnabled = true;
    _isKnowledgeBaseEnabled = true;
    _ongoingFetch = null;
  }

  ExtraInfoConfig buildExtraInfoConfig({String? query, int maxResults = 5}) {
    // Auto-enable if query contains URL (mimic Web behavior)
    final bool autoEnable = query != null && _containsUrl(query);
    final bool shouldBeEnabled = _isWebEnabled || autoEnable;

    if (!shouldBeEnabled) {
      return ExtraInfoConfig(
        enabled: false,
        maxResults: maxResults,
        resources: const [],
      );
    }

    final selected =
        _webResources.where((r) => _selectedWebUris.contains(r.uri)).toList();

    return ExtraInfoConfig(
      enabled: true,
      maxResults: maxResults,
      resources: selected,
    );
  }

  IntraInfoConfig buildIntraInfoConfig({int maxResults = 5}) {
    // If globally disabled, return disabled config immediately
    if (!_isKnowledgeBaseEnabled) {
      return IntraInfoConfig(
        enabled: false,
        maxResults: maxResults,
        resources: const [],
      );
    }

    final selected = _knowledgeBaseResources
        .where((r) => _selectedKnowledgeBaseUris.contains(r.uri))
        .toList();

    return IntraInfoConfig(
      enabled: true,
      maxResults: maxResults,
      resources: selected,
    );
  }

  bool _containsUrl(String text) {
    final urlPattern = RegExp(
      r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/[^\s]+)',
      caseSensitive: false,
    );
    return urlPattern.hasMatch(text);
  }

  Future<void> ensureRemoteResourcesLoaded() async {
    if (_ongoingFetch != null) {
      await _ongoingFetch;
      return;
    }

    _ongoingFetch = _fetchRagResources();
    await _ongoingFetch;
    _ongoingFetch = null;
  }

  Future<void> _fetchRagResources() async {
    try {
      final dio =
          Injector.instance<Dio>(instanceName: DioModule.dioInstanceName);

      final token = await _localStorage.getString(key: AppKeys.accessTokenKey);

      final response = await dio.get(
        '/api/v1/rag/resources',
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final resourcesJson = data['resources'] as List<dynamic>?;
        if (resourcesJson != null && resourcesJson.isNotEmpty) {
          final fetchedResources = resourcesJson
              .map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList();

          final previousSelection = _selectedKnowledgeBaseUris;
          _knowledgeBaseResources = fetchedResources;

          final newUris = fetchedResources.map((r) => r.uri).toSet();
          final retainedSelection = previousSelection.intersection(newUris);
          final addedNewUris = newUris.difference(previousSelection);

          _selectedKnowledgeBaseUris = retainedSelection.union(addedNewUris);
        }
      }
    } catch (_) {
      // Silently ignore; fallback lists will continue to be used
    }
  }

  /// Update available sources based on incoming SSE search results.
  /// This keeps the selector in sync with what the backend actually searched.
  void ingestSearchResults(List<SearchResult> results) {
    if (results.isEmpty) return;

    final List<Resource> web = [];
    final List<Resource> knowledgeBase = [];

    for (final result in results) {
      final rawUrl = result.url.trim();
      if (rawUrl.isEmpty) continue;

      final normalizedTitle = result.title.trim().isNotEmpty
          ? result.title.trim()
          : _titleFromUri(rawUrl);

      final resource = Resource(
        uri: rawUrl,
        title: normalizedTitle,
        description:
            result.content.trim().isNotEmpty ? result.content.trim() : null,
      );

      if (_isKnowledgeBaseUri(rawUrl)) {
        knowledgeBase.add(resource);
      } else {
        web.add(resource);
      }
    }

    _updateWebResources(web);
    _updateKnowledgeBaseResources(knowledgeBase);
  }

  void _updateWebResources(List<Resource> newResources) {
    if (newResources.isEmpty) return;

    // Combine current resources with new ones, prioritizing defaults at top is standard,
    // but here we just append unique ones.
    // We use a Map to dedup by URI.
    final Map<String, Resource> combined = {};

    for (final r in _webResources) {
      combined[r.uri] = r;
    }
    for (final r in newResources) {
      combined[r.uri] = r;
    }

    _webResources = combined.values.toList();

    // Auto-select new resources if that's the desired behavior (usually yes for "search")
    // But user request said "it should only add more sources".
    // Usually in this app flow, if the agent finds sources, they are used.
    // So we add them to selection.
    final newUris = newResources.map((r) => r.uri).toSet();
    _selectedWebUris.addAll(newUris);
  }

  void _updateKnowledgeBaseResources(List<Resource> newResources) {
    if (newResources.isEmpty) return;

    final Map<String, Resource> combined = {};
    for (final r in _knowledgeBaseResources) {
      combined[r.uri] = r;
    }
    for (final r in newResources) {
      combined[r.uri] = r;
    }

    _knowledgeBaseResources = combined.values.toList();

    final newUris = newResources.map((r) => r.uri).toSet();
    _selectedKnowledgeBaseUris.addAll(newUris);
  }

  bool _isKnowledgeBaseUri(String uri) => uri.startsWith('rag://dataset/');

  String _titleFromUri(String uri) {
    try {
      final parsed = Uri.parse(uri);
      return parsed.host.isNotEmpty ? parsed.host : uri;
    } catch (_) {
      return uri;
    }
  }
}

// Default web resources mirror the web app dropdown
const List<Resource> _defaultWebResources = [
  Resource(uri: 'https://vtv.vn', title: 'Báo VTV'),
  Resource(uri: 'https://vnexpress.net', title: 'Báo VNExpress'),
  Resource(uri: 'https://dantri.com.vn', title: 'Báo Dân trí'),
  Resource(uri: 'https://vov.vn', title: 'Báo điện tử VOV'),
  Resource(uri: 'https://vneconomy.vn', title: 'Tạp chí kinh tế Việt Nam'),
  Resource(
      uri: 'https://vietnamfinance.vn',
      title: 'Tạp chí chuyên sâu về kinh tế tài chính'),
  Resource(
      uri: 'https://cafef.vn',
      title: 'Kênh thông tin kinh tế - tài chính Việt nam CafeF'),
  Resource(
      uri: 'https://chinhphu.vn', title: 'Cổng Thông tin điện tử Chính phủ'),
  Resource(
      uri: 'https://dangcongsan.org.vn',
      title: 'Cổng thông tin điện tử Đảng Cộng sản Việt Nam'),
  Resource(uri: 'https://baochinhphu.vn', title: 'Báo Điện tử Chính phủ'),
  Resource(uri: 'https://luatvietnam.vn', title: 'Luật Việt Nam'),
  Resource(uri: 'https://thuvienphapluat.vn', title: 'Thư viện Pháp luật'),
  Resource(
      uri: 'https://genk.vn', title: 'Trang thông tin điện tử tổng hợp Genk'),
  Resource(uri: 'https://tiasang.com.vn', title: 'Tạp chí tia sáng'),
  Resource(uri: 'https://scitechdaily.com', title: 'Scitechdaily'),
  Resource(
      uri: 'https://www.technologyreview.com', title: 'MIT Technology Review'),
];

// Default knowledge base resources (datasets)
const List<Resource> _defaultKnowledgeBaseResources = [
  Resource(
    uri: 'rag://dataset/68d775c2cf2011f0b68bee4add2f28e0',
    title: 'Test',
  ),
  Resource(
    uri: 'rag://dataset/919d1bf8ca8c11f0ab82c6efc818388e',
    title: 'Kinh tế tài chính',
  ),
  Resource(
    uri: 'rag://dataset/30cf3e82ca8c11f09e16c6efc818388e',
    title: 'Chính trị',
  ),
  Resource(
    uri: 'rag://dataset/de45ba0ac84811f0b07ac6efc818388e',
    title: 'Khoa học công nghệ',
  ),
  Resource(
    uri: 'rag://dataset/cb058d08c0c311f091d536febb3bd76d',
    title: 'Thư viện pháp luật',
  ),
  Resource(
    uri: 'rag://dataset/f152f4a2ba8b11f0b42e42712a4e326d',
    title: 'synthnet-knowledge-base',
    description: 'Knowledge base for SynthNet',
  ),
];
