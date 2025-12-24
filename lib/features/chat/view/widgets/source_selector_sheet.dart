import 'package:flutter/material.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/view/widgets/source_utils.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/data/source_service.dart';
import 'package:insider/generated/l10n.dart';

// We no longer rely on returning a result, but we keep this class if needed for other callers
class SourceSelectorResult {
  const SourceSelectorResult({
    required this.webUris,
    required this.knowledgeBaseUris,
    required this.isWebEnabled,
    required this.isKnowledgeBaseEnabled,
  });

  final Set<String> webUris;
  final Set<String> knowledgeBaseUris;
  final bool isWebEnabled;
  final bool isKnowledgeBaseEnabled;
}

class SourceSelectorSheet extends StatefulWidget {
  const SourceSelectorSheet({
    super.key,
    required this.webResources,
    required this.knowledgeBaseResources,
    required this.selectedWebUris,
    required this.selectedKnowledgeBaseUris,
    required this.isWebEnabled,
    required this.isKnowledgeBaseEnabled,
    required this.isDark,
    required this.sourceService,
  });

  final List<Resource> webResources;
  final List<Resource> knowledgeBaseResources;
  final Set<String> selectedWebUris;
  final Set<String> selectedKnowledgeBaseUris;
  final bool isWebEnabled;
  final bool isKnowledgeBaseEnabled;
  final bool isDark;
  final SourceService sourceService;

  static Future<SourceSelectorResult?> show({
    required BuildContext context,
    required bool isDark,
    required List<Resource> webResources,
    required List<Resource> knowledgeBaseResources,
    required Set<String> selectedWebUris,
    required Set<String> selectedKnowledgeBaseUris,
    required SourceService sourceService,
    bool isWebEnabled = true,
    bool isKnowledgeBaseEnabled = true,
  }) {
    return showModalBottomSheet<SourceSelectorResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (_) {
        return SourceSelectorSheet(
          webResources: webResources,
          knowledgeBaseResources: knowledgeBaseResources,
          selectedWebUris: selectedWebUris,
          selectedKnowledgeBaseUris: selectedKnowledgeBaseUris,
          isWebEnabled: isWebEnabled,
          isKnowledgeBaseEnabled: isKnowledgeBaseEnabled,
          isDark: isDark,
          sourceService: sourceService,
        );
      },
    );
  }

  @override
  State<SourceSelectorSheet> createState() => _SourceSelectorSheetState();
}

class _SourceSelectorSheetState extends State<SourceSelectorSheet> {
  // Navigation State
  int _currentPage = 0; // 0 = Dashboard, 1 = Web Detail, 2 = KB Detail
  late PageController _pageController;

  // Selection State
  late Set<String> _webSelection;
  late Set<String> _kbSelection;
  late bool _isWebEnabled;
  late bool _isKbEnabled;

  // Search State
  String _filter = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _webSelection = Set<String>.from(widget.selectedWebUris);
    _kbSelection = Set<String>.from(widget.selectedKnowledgeBaseUris);
    _isWebEnabled = widget.isWebEnabled;
    _isKbEnabled = widget.isKnowledgeBaseEnabled;
  }

  @override
  void dispose() {
    _finalizeToggles();
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _finalizeToggles() {
    bool webEnabled = _isWebEnabled;
    bool kbEnabled = _isKbEnabled;

    if (_webSelection.isEmpty) webEnabled = false;
    if (_kbSelection.isEmpty) kbEnabled = false;

    // Ensure final state logic "Empty = Off" is enforced when closing
    widget.sourceService.updateSelection(
      isWebEnabled: webEnabled,
      isKnowledgeBaseEnabled: kbEnabled,
    );
  }

  void _navigateTo(int pageIndex) {
    setState(() {
      _filter = '';
      _searchController.clear();
      _currentPage = pageIndex;
    });
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutQuint,
    );
  }

  void _onBack() {
    if (_currentPage == 0) return;

    // Check "Empty = Off" rule before returning to dashboard
    if (_webSelection.isEmpty && _isWebEnabled) {
      setState(() => _isWebEnabled = false);
      widget.sourceService.updateSelection(isWebEnabled: false);
    }
    if (_kbSelection.isEmpty && _isKbEnabled) {
      setState(() => _isKbEnabled = false);
      widget.sourceService.updateSelection(isKnowledgeBaseEnabled: false);
    }

    _navigateTo(0);
  }

  // --- Logic Helpers ---

  void _updateWebToggle(bool value) {
    setState(() {
      _isWebEnabled = value;
      if (value && _webSelection.isEmpty && widget.webResources.isNotEmpty) {
        _webSelection = widget.webResources.map((e) => e.uri).toSet();
        widget.sourceService.updateSelection(webUris: _webSelection);
      }
    });
    widget.sourceService.updateSelection(isWebEnabled: value);
  }

  void _updateKbToggle(bool value) {
    setState(() {
      _isKbEnabled = value;
      if (value &&
          _kbSelection.isEmpty &&
          widget.knowledgeBaseResources.isNotEmpty) {
        _kbSelection = widget.knowledgeBaseResources.map((e) => e.uri).toSet();
        widget.sourceService.updateSelection(knowledgeBaseUris: _kbSelection);
      }
    });
    widget.sourceService.updateSelection(isKnowledgeBaseEnabled: value);
  }

  void _toggleWebItem(String uri, bool selected) {
    setState(() {
      if (selected) {
        _webSelection.add(uri);
      } else {
        _webSelection.remove(uri);
      }
      // DO NOT disable immediately
    });
    widget.sourceService.updateSelection(webUris: _webSelection);
  }

  void _toggleKbItem(String uri, bool selected) {
    setState(() {
      if (selected) {
        _kbSelection.add(uri);
      } else {
        _kbSelection.remove(uri);
      }
    });
    widget.sourceService.updateSelection(knowledgeBaseUris: _kbSelection);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double targetHeight = _currentPage == 0 ? 300 : (screenHeight * 0.85);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutQuint,
      height: targetHeight + MediaQuery.of(context).viewInsets.bottom,
      decoration: BoxDecoration(
        color: widget.isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(
          top: BorderSide(
            color: widget.isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.05),
            width: 1,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: WillPopScope(
          onWillPop: () async {
            if (_currentPage != 0) {
              _onBack();
              return false;
            }
            return true;
          },
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildDashboard(),
              _buildDetailView(
                title: S.current.web_search,
                allResources: widget.webResources,
                selection: _webSelection,
                onToggle: _toggleWebItem,
                onSelectAll: () {
                  setState(() {
                    if (_webSelection.length == widget.webResources.length) {
                      _webSelection.clear();
                      // Keep enabled
                    } else {
                      _webSelection =
                          widget.webResources.map((e) => e.uri).toSet();
                      _isWebEnabled = true;
                    }
                    widget.sourceService.updateSelection(
                        webUris: _webSelection, isWebEnabled: _isWebEnabled);
                  });
                },
                isEnabled: _isWebEnabled,
              ),
              _buildDetailView(
                title: S.current.internal_resources,
                allResources: widget.knowledgeBaseResources,
                selection: _kbSelection,
                onToggle: _toggleKbItem,
                onSelectAll: () {
                  setState(() {
                    if (_kbSelection.length ==
                        widget.knowledgeBaseResources.length) {
                      _kbSelection.clear();
                    } else {
                      _kbSelection = widget.knowledgeBaseResources
                          .map((e) => e.uri)
                          .toSet();
                      _isKbEnabled = true;
                    }
                    widget.sourceService.updateSelection(
                        knowledgeBaseUris: _kbSelection,
                        isKnowledgeBaseEnabled: _isKbEnabled);
                  });
                },
                isEnabled: _isKbEnabled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- 1. Dashboard View ---

  Widget _buildDashboard() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildHeader(
            title: S.current.source_configuration,
            showBack: false,
            onClose: () => Navigator.pop(context),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildDashboardRow(
                  icon: Icons.language,
                  title: S.current.web_search,
                  subtitle: S.current.web_search_subtitle,
                  isEnabled: _isWebEnabled,
                  onToggle: _updateWebToggle,
                  onTap: () => _navigateTo(1),
                ),
                const SizedBox(height: 16),
                _buildDashboardRow(
                  icon: Icons.description_outlined,
                  title: S.current.internal_resources,
                  subtitle: S.current.internal_resources_subtitle,
                  isEnabled: _isKbEnabled,
                  onToggle: _updateKbToggle,
                  onTap: () => _navigateTo(2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildDashboardRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isEnabled,
    required ValueChanged<bool> onToggle,
    required VoidCallback onTap,
  }) {
    final textColor = widget.isDark ? Colors.white : Colors.black;
    final subTextColor = widget.isDark ? Colors.white54 : Colors.black54;
    final rowBg =
        widget.isDark ? Colors.white.withOpacity(0.05) : Colors.grey[100];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: rowBg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: widget.isDark
                    ? Colors.white.withOpacity(0.1)
                    : DesignSystem.primaryCyan.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: widget.isDark ? Colors.white : DesignSystem.primaryCyan,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Switch.adaptive(
                  value: isEnabled,
                  onChanged: onToggle,
                  activeColor: DesignSystem.primaryCyan,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right,
                  color: subTextColor,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // --- 2. Detail View ---

  Widget _buildDetailView({
    required String title,
    required List<Resource> allResources,
    required Set<String> selection,
    required Function(String, bool) onToggle,
    required VoidCallback onSelectAll,
    required bool isEnabled,
  }) {
    final filtered = allResources.where((r) {
      if (_filter.isEmpty) return true;
      return r.title.toLowerCase().contains(_filter.toLowerCase()) ||
          r.uri.toLowerCase().contains(_filter.toLowerCase());
    }).toList();

    return Column(
      children: [
        const SizedBox(height: 16),
        _buildHeader(
          title: title,
          showBack: true,
          onClose: () => Navigator.pop(context),
          onBack: _onBack,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextField(
            controller: _searchController,
            onChanged: (val) => setState(() => _filter = val),
            style:
                TextStyle(color: widget.isDark ? Colors.white : Colors.black),
            decoration: InputDecoration(
              hintText: S.current.search_resources_hint,
              hintStyle: TextStyle(
                  color: widget.isDark ? Colors.white38 : Colors.black38),
              prefixIcon: Icon(
                Icons.search,
                color: widget.isDark ? Colors.white54 : Colors.black54,
              ),
              filled: true,
              fillColor: widget.isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),

        // Select All Row
        if (_filter.isEmpty)
          Opacity(
            opacity: isEnabled ? 1.0 : 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ListTile(
                onTap: isEnabled ? onSelectAll : null,
                leading: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: widget.isDark ? Colors.white10 : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.checklist,
                    size: 18,
                    color: widget.isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
                title: Text(
                  S.current.select_all,
                  style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                trailing: Checkbox(
                  value: selection.length == allResources.length &&
                      allResources.isNotEmpty,
                  onChanged: isEnabled ? (_) => onSelectAll() : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  activeColor: DesignSystem.primaryCyan,
                ),
              ),
            ),
          ),

        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: filtered.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (context, index) {
              final item = filtered[index];
              final isSelected = selection.contains(item.uri);

              return Opacity(
                opacity: isEnabled ? 1.0 : 0.5,
                child: ListTile(
                  onTap:
                      isEnabled ? () => onToggle(item.uri, !isSelected) : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  leading: _buildFavicon(item),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _getDomain(item.uri),
                    style: TextStyle(
                      color: widget.isDark ? Colors.white38 : Colors.black38,
                      fontSize: 12,
                    ),
                  ),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: isEnabled
                        ? (val) => onToggle(item.uri, val ?? false)
                        : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    activeColor: DesignSystem.primaryCyan,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- Helpers ---

  Widget _buildHeader({
    required String title,
    required bool showBack,
    required VoidCallback onClose,
    VoidCallback? onBack,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBack)
            IconButton(
              icon: Icon(Icons.arrow_back,
                  color: widget.isDark ? Colors.white : Colors.black),
              onPressed: onBack,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )
          else
            const SizedBox(width: 24), // Spacer

          Text(
            title,
            style: TextStyle(
              color: widget.isDark ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          GestureDetector(
            onTap: onClose,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: widget.isDark
                    ? Colors.white10
                    : Colors.black.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: 18,
                color: widget.isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavicon(Resource item) {
    if (item.uri.startsWith('rag://')) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: widget.isDark ? Colors.white10 : Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.description_outlined,
          size: 16,
          color: widget.isDark ? Colors.white70 : Colors.black54,
        ),
      );
    }

    final favicon = getFaviconUrl(item.uri);
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
          color: widget.isDark ? Colors.white.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.isDark ? Colors.white10 : Colors.grey[200]!,
          )),
      padding: const EdgeInsets.all(4),
      child: favicon != null
          ? Image.network(
              favicon,
              errorBuilder: (_, __, ___) => const Icon(Icons.public, size: 16),
            )
          : const Icon(Icons.public, size: 16),
    );
  }

  String _getDomain(String uri) {
    try {
      if (uri.startsWith('rag://')) return 'dataset';
      return Uri.parse(uri).host;
    } catch (_) {
      return uri;
    }
  }
}
