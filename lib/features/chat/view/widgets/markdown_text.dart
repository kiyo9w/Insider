import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/view/widgets/source_utils.dart';

import 'package:insider/generated/l10n.dart';

class MarkdownText extends StatelessWidget {
  final String text;
  final bool isDark;
  final Function(List<int>)? onCitationTap;
  final List<dynamic>? sources;

  const MarkdownText({
    super.key,
    required this.text,
    required this.isDark,
    this.onCitationTap,
    this.sources,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Merge adjacent citations e.g. [1][2] -> [1, 2]
    var processedText = text.replaceAll(RegExp(r'(?<=\d)\]\[(?=\d)'), ', ');

    // 2. Handle [1, 2, 3] style citations by replacing them with a unique ID
    // that Markdown can parse as a single number (e.g. 90000+).
    // map valid ID -> List of indices
    final Map<int, List<int>> multiCitations = {};
    int placeholderIdCounter = 90000;

    // Regex to find [1, 2, 3] or [1, 2] patterns
    // Matches: [digits, digits, ...]
    final multiCitationRegex = RegExp(r'\[(\d+(?:,\s*\d+)+)\]');

    processedText = processedText.replaceAllMapped(multiCitationRegex, (match) {
      final content = match.group(1)!;
      final indices = content
          .split(',')
          .map((e) => int.tryParse(e.trim()) ?? 0)
          .where((i) => i > 0)
          .toList();

      if (indices.isNotEmpty) {
        final placeholderId = placeholderIdCounter++;
        multiCitations[placeholderId] = indices;
        return '[$placeholderId]';
      }
      return match.group(0)!;
    });

    return GptMarkdown(
      processedText,
      style: TextStyle(
        color: isDark
            ? DesignSystem.textPrimaryDark
            : DesignSystem.textPrimaryLight,
        fontSize: 16,
        height: 1.6,
        fontWeight: FontWeight.w400,
      ),
      sourceTagBuilder: (context, content, style) {
        // Parse the content (expecting a single number from GptMarkdown)
        // Check if it's one of our placeholders
        final singleIndex = int.tryParse(content.trim()) ?? 0;
        List<int> indices = [];

        if (multiCitations.containsKey(singleIndex)) {
          indices = multiCitations[singleIndex]!;
        } else {
          // Fallback for normal [1] or if parsing failed
          indices = content
              .split(',')
              .map((e) => int.tryParse(e.trim()) ?? 0)
              .where((i) => i > 0)
              .toList();
        }

        final effectiveSources = sources ?? const [];

        // Don't render empty citations
        if (indices.isEmpty) {
          return const SizedBox.shrink();
        }

        final firstIndex = indices.first;
        final count = indices.length;

        String sourceName = '$firstIndex';
        String? faviconUrl;

        // Check if we have valid sources to display
        if (firstIndex > 0 && firstIndex <= effectiveSources.length) {
          final source = effectiveSources[firstIndex - 1];
          if (source is Map) {
            final url = source['url'] as String?;
            final title = source['title'] as String?;

            // Prefer title, then derive from source/url
            if (title != null && title.trim().isNotEmpty) {
              sourceName = title.trim();
              // Truncate long titles
              if (sourceName.length > 25) {
                sourceName = '${sourceName.substring(0, 22)}...';
              }
            } else {
              sourceName = deriveSourceName(
                source: source['source'] as String?,
                url: url,
              );
            }

            if (url != null && url.isNotEmpty) {
              faviconUrl = getFaviconUrl(url);
            }
          }
        } else if (effectiveSources.isEmpty) {
          // Sources not loaded yet - show just the number
          sourceName = '$firstIndex';
        }

        String label = sourceName;
        if (count > 1) {
          label += S.of(context).plus_count_more(count - 1);
        }

        return GestureDetector(
          onTap: () => onCitationTap?.call(indices),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.fromLTRB(6, 4, 8, 4),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (faviconUrl != null && faviconUrl.isNotEmpty) ...[
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.network(
                        faviconUrl,
                        width: 12,
                        height: 12,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                ] else ...[
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
