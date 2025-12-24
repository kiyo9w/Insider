import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/view/widgets/source_utils.dart';
import 'package:insider/generated/l10n.dart';

class SourcesBottomSheet extends StatelessWidget {
  final List<dynamic>? sources;
  final int sourceCount;
  final bool isDark;
  final List<int>? filterIndices;

  const SourcesBottomSheet({
    super.key,
    required this.sources,
    required this.sourceCount,
    required this.isDark,
    this.filterIndices,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSources = sources ?? const [];

    List<dynamic> displaySources = List<dynamic>.from(effectiveSources);
    List<int> displayIndices =
        List.generate(effectiveSources.length, (i) => i + 1);

    if (filterIndices != null && filterIndices!.isNotEmpty) {
      displaySources = [];
      displayIndices = [];
      final seen = <int>{};
      for (final index in filterIndices!) {
        if (index > 0 &&
            index <= effectiveSources.length &&
            !seen.contains(index)) {
          seen.add(index);
          displaySources.add(effectiveSources[index - 1]);
          displayIndices.add(index);
        }
      }

      // If no valid indices matched, fall back to showing all sources.
      if (displaySources.isEmpty) {
        displaySources = List<dynamic>.from(effectiveSources);
        displayIndices = List.generate(effectiveSources.length, (i) => i + 1);
      }
    }

    final effectiveCount = displaySources.length;

    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 20),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[700] : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.library_books,
                  size: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  S.current.sources_title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Divider(
            height: 1,
            color: isDark ? Colors.grey[800] : Colors.grey[200],
          ),
          Expanded(
            child: effectiveCount == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.source_outlined,
                          size: 48,
                          color: isDark ? Colors.grey[600] : Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          S.current.no_sources_available,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.grey[500] : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.current.sources_will_appear_here,
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.grey[600] : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: effectiveCount,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final sourceIndex = displayIndices[index];
                      final sourceData = displaySources[index];

                      String title = S.current.source_index(sourceIndex);
                      String? description;
                      String sourceName = S.current.unknown_source;
                      String? faviconUrl;
                      String url = '';

                      if (sourceData is SearchResult) {
                        url = sourceData.url;
                        final snippet = sourceData.content;

                        title = sourceData.title.trim();
                        if (title.isEmpty) {
                          title = deriveSourceName(
                            url: url.isNotEmpty ? url : null,
                          );
                        }

                        description = snippet.trim().isNotEmpty
                            ? snippet.trim()
                            : (url.isNotEmpty ? url : null);

                        sourceName = deriveSourceName(
                          url: url.isNotEmpty ? url : null,
                        );

                        if (url.isNotEmpty) {
                          faviconUrl = getFaviconUrl(url);
                        }
                      } else if (sourceData is Map) {
                        final titleValue = sourceData['title'];
                        final snippetValue =
                            sourceData['snippet'] ?? sourceData['content'];
                        final urlValue = sourceData['url'];
                        final sourceValue = sourceData['source'];

                        url = urlValue?.toString() ?? '';
                        final snippet = snippetValue?.toString() ?? '';

                        title = (titleValue?.toString() ?? title).trim();
                        if (title.isEmpty) {
                          title = deriveSourceName(
                            source: sourceValue?.toString(),
                            url: url.isNotEmpty ? url : null,
                          );
                        }

                        description = snippet.trim().isNotEmpty
                            ? snippet.trim()
                            : (url.isNotEmpty ? url : null);

                        sourceName = deriveSourceName(
                          source: sourceValue?.toString(),
                          url: url.isNotEmpty ? url : null,
                        );

                        if (url.isNotEmpty) {
                          faviconUrl = getFaviconUrl(url);
                        }
                      } else if (sourceData is String) {
                        title = sourceData;
                      }

                      return InkWell(
                        onTap: () async {
                          if (url.isNotEmpty) {
                            final uri = Uri.parse(url);
                            try {
                              await launchUrl(uri,
                                  mode: LaunchMode.externalApplication);
                            } catch (e) {
                              debugPrint('Could not launch $url: $e');
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 2),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xFF333333)
                                      : const Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '$sourceIndex',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? Colors.grey[400]
                                        : Colors.grey[600],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                        height: 1.3,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (description != null) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        description,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: isDark
                                              ? Colors.grey[500]
                                              : Colors.grey[600],
                                          height: 1.4,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        if (faviconUrl != null) ...[
                                          Container(
                                            width: 14,
                                            height: 14,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: ClipOval(
                                              child: Image.network(
                                                faviconUrl,
                                                width: 14,
                                                height: 14,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Icon(
                                                  Icons.public,
                                                  size: 10,
                                                  color: isDark
                                                      ? Colors.grey[400]
                                                      : Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ] else ...[
                                          Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isDark
                                                  ? const Color(0xFF333333)
                                                  : const Color(0xFFEEEEEE),
                                            ),
                                            child: Icon(
                                              Icons.description_outlined,
                                              size: 10,
                                              color: isDark
                                                  ? Colors.grey[400]
                                                  : Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            sourceName,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: isDark
                                                  ? Colors.grey[400]
                                                  : Colors.grey[600],
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
