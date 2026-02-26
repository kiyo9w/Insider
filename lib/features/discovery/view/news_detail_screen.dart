import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/data/repositories/news/news_repository.dart';
import 'package:rest_client/rest_client.dart';
import 'package:insider/features/chat/view/widgets/markdown_text.dart';
import 'package:insider/features/chat/view/widgets/sources_bottom_sheet.dart';
import 'package:insider/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.newsId, this.article});

  final String newsId;
  final ArticleListItem? article;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  late Future<ArticleDetailResponse> _future;

  @override
  void initState() {
    super.initState();
    // Only use passed article if it has content, otherwise fetch full details
    if (widget.article != null &&
        (widget.article!.content ?? '').isNotEmpty &&
        (widget.article!.sourceUrls.isNotEmpty)) {
      _future = Future.value(
        ArticleDetailResponse(
          id: widget.article!.id,
          storyId: widget.article!.storyId,
          title: widget.article!.title,
          summary: widget.article!.summary,
          topImage: widget.article!.topImage,
          keywords: widget.article!.keywords,
          sourceUrls: widget.article!.sourceUrls,
          topic: widget.article!.topic,
          locale: widget.article!.locale,
          createdAt: widget.article!.createdAt,
          updatedAt: widget.article!.updatedAt,
          content: widget.article!.content ?? '',
          modelUsed: widget.article!.modelUsed,
        ),
      );
    } else {
      _future =
          Injector.instance<NewsRepository>().getNewsDetail(widget.newsId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      appBar: AppBar(
        backgroundColor:
            isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          S.of(context).article_title,
          style: DesignSystem.headingSmall.copyWith(
            color: isDark
                ? DesignSystem.textPrimaryDark
                : DesignSystem.textPrimaryLight,
          ),
        ),
        centerTitle: false,
      ),
      body: FutureBuilder<ArticleDetailResponse>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  snapshot.error.toString(),
                  style: DesignSystem.bodyMedium.copyWith(
                    color: isDark
                        ? DesignSystem.textSecondaryDark
                        : DesignSystem.textSecondaryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final article = snapshot.data;

          if (article == null) {
            return Center(child: Text(S.of(context).article_not_found));
          }

          // Extract titles from content references section
          // Format: [1] [Title](url)
          final referenceMap = <String, String>{};
          try {
            final regex = RegExp(r'\[\d+\] \[(.*?)\]\((.*?)\)');
            final matches = regex.allMatches(article.content);
            for (final match in matches) {
              if (match.groupCount >= 2) {
                final title = match.group(1);
                final url = match.group(2);
                if (title != null && url != null) {
                  referenceMap[url] = title;
                }
              }
            }
          } catch (_) {}

          // Prepare sources for MarkdownText and BottomSheet
          final sources = article.sourceUrls.map((url) {
            final uri = Uri.tryParse(url);
            final title = referenceMap[url];
            return {
              'url': url,
              'title': title ?? uri?.host ?? 'Source',
              'source': uri?.host ?? '',
            };
          }).toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((article.topImage ?? '').isNotEmpty) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        article.topImage!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: isDark
                                ? DesignSystem.backgroundDarkElevated
                                : DesignSystem.backgroundLightElevated,
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: isDark
                                ? DesignSystem.backgroundDarkElevated
                                : DesignSystem.backgroundLightElevated,
                            child: Center(
                              child: Icon(
                                Icons.broken_image_outlined,
                                size: 40,
                                color: isDark
                                    ? DesignSystem.iconDark
                                    : DesignSystem.iconLight,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: -0.5,
                    color: isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 16),

                // Metadata Row: Source Pill + Date
                Row(
                  children: [
                    // Uses the internal _SourcesPill like DiscoveryScreen
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor:
                              isDark ? const Color(0xFF1E1E1E) : Colors.white,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) => SourcesBottomSheet(
                            sources: sources,
                            sourceCount: sources.length,
                            isDark: isDark,
                          ),
                        );
                      },
                      child: _SourcesPill(
                        sourceUrls: article.sourceUrls,
                        isDark: isDark,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _formatTime(article.createdAt ?? DateTime.now()),
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark
                            ? DesignSystem.textTertiaryDark
                            : DesignSystem.textTertiaryLight,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Summary
                if ((article.summary ?? '').isNotEmpty)
                  Text(
                    article.summary!,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      fontStyle: FontStyle.italic,
                      color: isDark
                          ? DesignSystem.textSecondaryDark
                          : DesignSystem.textSecondaryLight,
                    ),
                  ),

                const SizedBox(height: 24),

                // Main Content
                if ((article.content).isNotEmpty)
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: isDark
                          ? const Color(0xFFE4E4E7)
                          : const Color(0xFF18181B),
                    ),
                    child: MarkdownText(
                      text: article.content,
                      isDark: isDark,
                      sources: sources,
                      onCitationTap: (indices) {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor:
                              isDark ? const Color(0xFF1E1E1E) : Colors.white,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) => SourcesBottomSheet(
                            sources: sources,
                            sourceCount: sources.length,
                            isDark: isDark,
                            filterIndices: indices,
                          ),
                        );
                      },
                    ),
                  ),

                // Sources Section
                if (sources.isNotEmpty) ...[
                  Row(
                    children: [
                      Icon(Icons.layers_outlined,
                          size: 18,
                          color: isDark ? Colors.grey : Colors.black54),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).sources_title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sources.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final source = sources[index];
                        final domain = source['source'] as String;
                        final title = source['title'] as String;

                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: isDark
                                  ? const Color(0xFF1E1E1E)
                                  : Colors.white,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (context) => SourcesBottomSheet(
                                sources: sources,
                                sourceCount: sources.length,
                                isDark: isDark,
                                filterIndices: [index + 1],
                              ),
                            );
                          },
                          child: Container(
                            width: 220,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? const Color(0xFF1E1E1E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDark
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.black.withOpacity(0.1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? Colors.grey[800]
                                            : Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.network(
                                        'https://www.google.com/s2/favicons?domain=$domain&sz=64',
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            const Icon(Icons.public,
                                                size: 14, color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        domain,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  title != domain
                                      ? title
                                      : S.of(context).read_full_article,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3,
                                    color: isDark
                                        ? const Color(0xFFE4E4E7)
                                        : const Color(0xFF18181B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatTime(DateTime publishedTime) {
    final now = DateTime.now();
    final difference = now.difference(publishedTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    }
  }
}

class _SourcesPill extends StatelessWidget {
  const _SourcesPill({
    required this.sourceUrls,
    required this.isDark,
    this.compact = false,
  });

  final List<String> sourceUrls;
  final bool isDark;
  final bool compact;

  String? _getFaviconUrl(String url) {
    try {
      final uri = Uri.parse(url);
      if (uri.host.isNotEmpty) {
        return 'https://www.google.com/s2/favicons?domain=${uri.host}&sz=64';
      }
    } catch (_) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (sourceUrls.isEmpty) return const SizedBox.shrink();

    final count = sourceUrls.length;
    final displaySources = sourceUrls.take(3).toList();
    final iconSize = compact ? 16.0 : 18.0;
    final overlap = compact ? 6.0 : 8.0;

    final bgColor =
        isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight;

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: (iconSize * displaySources.length) -
                (overlap * (displaySources.length - 1)),
            height: iconSize,
            child: Stack(
              children: List.generate(displaySources.length, (index) {
                final url = displaySources[index];
                final favicon = _getFaviconUrl(url);

                return Positioned(
                  left: index * (iconSize - overlap),
                  child: Container(
                    width: iconSize,
                    height: iconSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: bgColor,
                        width: 1.5,
                      ),
                      color: isDark ? Colors.grey[800] : Colors.grey[200],
                    ),
                    child: ClipOval(
                      child: favicon != null
                          ? Image.network(
                              favicon,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  _buildFallbackIcon(iconSize),
                            )
                          : _buildFallbackIcon(iconSize),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$count sources',
            style: TextStyle(
              fontSize: compact ? 10 : 11,
              fontWeight: FontWeight.w500,
              color: isDark ? const Color(0xFFA1A1AA) : const Color(0xFF71717A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackIcon(double size) {
    return Icon(
      Icons.public,
      size: size * 0.7,
      color: Colors.grey,
    );
  }
}
