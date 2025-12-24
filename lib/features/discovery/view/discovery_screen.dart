import 'package:flutter/material.dart';
import 'package:rest_client/rest_client.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/features/discovery/cubit/news_cubit.dart';
import 'package:insider/features/discovery/cubit/news_state.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/data/repositories/news/news_repository.dart';
import 'package:shimmer/shimmer.dart';

import 'package:insider/generated/l10n.dart';

/// Discovery Screen - News and trending topics feed
/// Replicates Perplexity's discovery interface with article cards
class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        newsRepository: Injector.instance<NewsRepository>(),
      )..loadCategories(),
      child: _DiscoveryContent(showBackButton: showBackButton),
    );
  }
}

class _DiscoveryContent extends StatefulWidget {
  const _DiscoveryContent({this.showBackButton = true});

  final bool showBackButton;

  @override
  State<_DiscoveryContent> createState() => _DiscoveryContentState();
}

class _DiscoveryContentState extends State<_DiscoveryContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF111111)
          : const Color(0xFFF5F5F7), // slightly smoother backgrounds
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildHeader(context, isDark, state),
                Expanded(
                  child: _buildNewsFeed(context, isDark),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, NewsState state) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: DesignSystem.spacing12,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: DesignSystem.spacing16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.showBackButton) ...[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: isDark
                          ? DesignSystem.iconDark
                          : DesignSystem.iconLight,
                      size: 24,
                    ),
                    onPressed: () => context.go(AppRouter.homePath),
                  ),
                  const SizedBox(width: 4),
                ],
                // Distinct Top News (Text-only, no pill)
                GestureDetector(
                  onTap: () => context.read<NewsCubit>().selectCategory(null),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.transparent,
                    child: Text(
                      S.of(context).top_news,
                      style: TextStyle(
                        fontSize: 17, // Distinctly larger heading-like
                        fontWeight: state.selectedCategoryId == null
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: state.selectedCategoryId == null
                            ? (isDark ? Colors.white : Colors.black)
                            : (isDark ? Colors.grey[600] : Colors.grey[500]),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Separator
                Container(
                  width: 1,
                  height: 24,
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ...state.categories
                      .where(
                          (t) => t.slug != 'top-news' && t.label != 'Top News')
                      .map((topic) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _DiscoveryFilterPill(
                        label: topic.label,
                        isSelected: state.selectedCategoryId == topic.slug,
                        isDark: isDark,
                        onTap: () => context
                            .read<NewsCubit>()
                            .selectCategory(topic.slug),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsFeed(BuildContext context, bool isDark) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state.isLoading && state.articles.isEmpty) {
          return _buildLoadingShimmer(isDark);
        }

        if (state.error != null && state.articles.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: isDark
                        ? DesignSystem.textTertiaryDark
                        : DesignSystem.textTertiaryLight,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).failed_to_load_news,
                    style: DesignSystem.headingMedium.copyWith(
                      color: isDark
                          ? DesignSystem.textSecondaryDark
                          : DesignSystem.textSecondaryLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.error!,
                    style: DesignSystem.bodyMedium.copyWith(
                      color: isDark
                          ? DesignSystem.textTertiaryDark
                          : DesignSystem.textTertiaryLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NewsCubit>().loadArticles();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DesignSystem.primaryCyan,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(S.of(context).retry),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.articles.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: 64,
                    color: isDark
                        ? DesignSystem.textTertiaryDark
                        : DesignSystem.textTertiaryLight,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).no_articles_available,
                    style: DesignSystem.headingMedium.copyWith(
                      color: isDark
                          ? DesignSystem.textSecondaryDark
                          : DesignSystem.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Logical grouping of articles: [Big], [Small, Small], [Big], [Small, Small]...
        final groups = <List<ArticleListItem>>[];
        int i = 0;
        bool isBig = true;
        while (i < state.articles.length) {
          // Pattern: 1 item (Big) -> 2 items (Small)
          if (isBig) {
            groups.add([state.articles[i]]);
            i++;
            isBig = false;
          } else {
            // Take up to 2 items
            final nextChunk = <ArticleListItem>[];
            if (i < state.articles.length) nextChunk.add(state.articles[i]);
            if (i + 1 < state.articles.length)
              nextChunk.add(state.articles[i + 1]);
            groups.add(nextChunk);
            i += 2;
            isBig = true;
          }
        }

        return RefreshIndicator(
          onRefresh: () =>
              context.read<NewsCubit>().loadArticles(refresh: true),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= groups.length) {
                        if (state.hasMore) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return const SizedBox(height: 32);
                      }

                      final group = groups[index];
                      // Even index in 'groups' array corresponds to Big (isBig was true)
                      // Odd index corresponds to Small pair (isBig was false)
                      // HOWEVER, 'groups' list itself alternates from 0.
                      // 0: Big, 1: Pair, 2: Big...

                      final isFeaturedRow = index % 2 == 0;

                      if (isFeaturedRow && group.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _FeaturedNewsCard(
                            article: group.first,
                            isDark: isDark,
                          ),
                        );
                      } else {
                        // Grid/Row types
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (group.isNotEmpty)
                                  Expanded(
                                    child: _NewsCard(
                                        article: group[0], isDark: isDark),
                                  ),
                                const SizedBox(width: 12),
                                if (group.length > 1)
                                  Expanded(
                                    child: _NewsCard(
                                        article: group[1], isDark: isDark),
                                  )
                                else
                                  const Spacer(), // Keep 1st item same size as if it were in a pair
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    childCount: groups.length + 1, // +1 for loader/spacer
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingShimmer(bool isDark) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _ShimmerBox(width: double.infinity, height: 250, isDark: isDark),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (_, __) => _ShimmerBox(
                width: double.infinity, height: 180, isDark: isDark),
          ),
        ],
      ),
    );
  }
}

String _formatTime(DateTime? time, BuildContext context) {
  if (time == null) return '';
  final now = DateTime.now();
  final difference = now.difference(time);

  if (difference.inDays > 0) {
    return S.of(context).time_days_ago(difference.inDays);
  } else if (difference.inHours > 0) {
    return S.of(context).time_hours_ago(difference.inHours);
  } else if (difference.inMinutes > 0) {
    return S.of(context).time_minutes_ago(difference.inMinutes);
  } else {
    return S.of(context).just_now;
  }
}

class _FeaturedNewsCard extends StatelessWidget {
  const _FeaturedNewsCard({
    required this.article,
    required this.isDark,
  });

  final ArticleListItem article;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/news/detail', extra: article);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(16), // Rounded-xl
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.05)
                : Colors.black.withOpacity(0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.topImage != null)
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9, // Slightly wider for feature
                    child: Image.network(
                      article.topImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: isDark ? Colors.grey[800] : Colors.grey[200],
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600, // Medium/SemiBold
                      height: 1.3,
                      color: isDark ? Colors.white : Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                  if (article.summary != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      article.summary!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark
                            ? const Color(0xFFA1A1AA)
                            : const Color(0xFF52525B), // Muted foreground
                        height: 1.5,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _SourcesPill(
                        sourceUrls: article.sourceUrls,
                        isDark: isDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: isDark
                            ? const Color(0xFF71717A)
                            : const Color(0xFF71717A),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatTime(article.createdAt, context), // Just time
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? const Color(0xFF71717A)
                              : const Color(0xFF71717A),
                        ),
                      ),
                      const Spacer(),
                      // Removed Action Buttons as per earlier cleanup, but restored for safety if unused.
                      // Actually, user asked to remove "search bar and heart icon at the top".
                      // I should verify if these Action Buttons are needed on cards. User didn't say remove from cards.
                      // But I'll leave them as they were in my `view_file` capture (which had them).
                      _ActionButton(
                        icon: Icons.favorite_border,
                        isDark: isDark,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      _ActionButton(
                        icon: Icons.more_horiz,
                        isDark: isDark,
                        onTap: () {},
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
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({
    required this.article,
    required this.isDark,
  });

  final ArticleListItem article;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/news/detail', extra: article);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.05)
                : Colors.black.withOpacity(0.05),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: article.topImage != null
                  ? Image.network(
                      article.topImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: isDark ? Colors.grey[800] : Colors.grey[200],
                        child: const Icon(Icons.broken_image),
                      ),
                    )
                  : Container(
                      color: isDark ? Colors.grey[800] : Colors.grey[200],
                      child: Icon(
                        Icons.article,
                        color: isDark ? Colors.grey[600] : Colors.grey[400],
                      ),
                    ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15, // Slightly smaller for grid
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                        color: isDark ? Colors.white : Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SourcesPill(
                          sourceUrls: article.sourceUrls,
                          isDark: isDark,
                          compact: true,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatTime(article.createdAt, context),
                              style: TextStyle(
                                fontSize: 11,
                                color: isDark
                                    ? const Color(0xFF71717A)
                                    : const Color(0xFF71717A),
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              size: 16,
                              color: isDark
                                  ? const Color(0xFF71717A)
                                  : const Color(0xFF71717A),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

    // Web reference uses border-background.
    // In dark mode: 0xFF1E1E1E (card bg). Light: Colors.white.
    final borderColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1)),
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
                        color: borderColor,
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
            S.of(context).sources_count_text(count),
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

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.isDark,
    required this.onTap,
  });

  final IconData icon;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          size: 20,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.width,
    required this.height,
    required this.isDark,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  final double width;
  final double height;
  final bool isDark;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark
          ? DesignSystem.backgroundDarkElevated
          : DesignSystem.backgroundLightElevated,
      highlightColor: isDark ? DesignSystem.backgroundDarkCard : Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDark
              ? DesignSystem.backgroundDarkElevated
              : DesignSystem.backgroundLightElevated,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class _DiscoveryFilterPill extends StatelessWidget {
  const _DiscoveryFilterPill({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Colors based on requested aesthetics (Black/White high contrast)
    final bgColor = isSelected
        ? (isDark ? Colors.white : Colors.black)
        : Colors.transparent;

    final textColor = isSelected
        ? (isDark ? Colors.black : Colors.white)
        : (isDark
            ? DesignSystem.textTertiaryDark
            : DesignSystem.textTertiaryLight);

    final borderColor = isSelected
        ? Colors.transparent
        : (isDark
            ? Colors.white.withOpacity(0.1)
            : Colors.black.withOpacity(0.1));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20), // Pill shape
          border: isSelected ? null : Border.all(color: borderColor),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
