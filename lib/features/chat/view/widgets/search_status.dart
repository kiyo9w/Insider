import 'package:flutter/material.dart';
import 'package:insider/core/design_system/design_system.dart';

class SearchingSection extends StatelessWidget {
  final List<String> queries;
  final bool isDark;

  const SearchingSection({
    super.key,
    required this.queries,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SEARCHING',
            style: TextStyle(
              color: isDark
                  ? DesignSystem.textTertiaryDark
                  : DesignSystem.textTertiaryLight,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          ...queries.map((query) => _SearchQueryPill(query: query, isDark: isDark)),
        ],
      ),
    );
  }
}

class ReadingSection extends StatelessWidget {
  final int readingCount;
  final bool isDark;

  const ReadingSection({
    super.key,
    required this.readingCount,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: Row(
        children: [
          Text(
            'READING',
            style: TextStyle(
              color: isDark
                  ? DesignSystem.textTertiaryDark
                  : DesignSystem.textTertiaryLight,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              height: 1.2,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$readingCount',
            style: TextStyle(
              color: isDark
                  ? DesignSystem.textTertiaryDark
                  : DesignSystem.textTertiaryLight,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchQueryPill extends StatelessWidget {
  final String query;
  final bool isDark;

  const _SearchQueryPill({
    required this.query,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isDark
            ? DesignSystem.backgroundDarkElevated
            : DesignSystem.backgroundLightElevated,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isDark
              ? DesignSystem.borderDark.withOpacity(0.3)
              : DesignSystem.borderLight.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 15,
            color: isDark
                ? DesignSystem.textSecondaryDark
                : DesignSystem.textSecondaryLight,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              query,
              style: TextStyle(
                color: isDark
                    ? DesignSystem.textSecondaryDark
                    : DesignSystem.textSecondaryLight,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


















