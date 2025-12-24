import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/app/bloc/app_bloc.dart';
import 'package:insider/generated/l10n.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedLanguage = 0;

  @override
  void initState() {
    super.initState();
    final currentLocale = context.read<AppBloc>().state.locale;
    _selectedLanguage = currentLocale == 'vi' ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, isDark),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildLanguagePreview(isDark),
                    const SizedBox(height: 24),
                    _buildLanguageSelector(isDark),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              ),
            ),
          ),
          Expanded(
            child: Text(
              S.of(context).app_language,
              textAlign: TextAlign.center,
              style: DesignSystem.headingMedium.copyWith(
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildLanguagePreview(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark
            ? DesignSystem.backgroundDarkElevated
            : DesignSystem.backgroundLightElevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 6,
            width: 80,
            decoration: BoxDecoration(
              color: DesignSystem.primaryCyan,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: isDark
                  ? DesignSystem.backgroundDarkCard
                  : DesignSystem.backgroundLightCard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark
                    ? DesignSystem.borderDark
                    : DesignSystem.borderLight,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.language_rounded,
                    size: 20,
                    color: isDark
                        ? DesignSystem.iconDark
                        : DesignSystem.iconLight,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _selectedLanguage == 0
                        ? S.of(context).english
                        : S.of(context).vietnamese,
                    style: DesignSystem.bodyMedium.copyWith(
                      color: isDark
                          ? DesignSystem.textPrimaryDark
                          : DesignSystem.textPrimaryLight,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? DesignSystem.backgroundDarkCard
                  : DesignSystem.backgroundLightCard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark
                    ? DesignSystem.borderDark
                    : DesignSystem.borderLight,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).app_language,
                  style: DesignSystem.bodyMedium.copyWith(
                    color: isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _selectedLanguage == 0
                      ? 'Select your preferred language for the app '
                          'interface.'
                      : 'Chọn ngôn ngữ ưa thích của bạn cho giao diện ứng '
                          'dụng.',
                  style: DesignSystem.bodySmall.copyWith(
                    color: isDark
                        ? DesignSystem.textSecondaryDark
                        : DesignSystem.textSecondaryLight,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildLanguageOption(
            S.of(context).english,
            0,
            isDark,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildLanguageOption(
            S.of(context).vietnamese,
            1,
            isDark,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageOption(String label, int index, bool isDark) {
    final isSelected = _selectedLanguage == index;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() {
          _selectedLanguage = index;
        });

        final locale = index == 0 ? 'en' : 'vi';
        context.read<AppBloc>().add(
              AppEvent.localeChanged(locale: locale),
            );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                  ? DesignSystem.backgroundDarkElevated
                  : DesignSystem.backgroundLightElevated)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? DesignSystem.primaryCyan
                : (isDark
                    ? DesignSystem.borderDark
                    : DesignSystem.borderLight),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected
                ? DesignSystem.primaryCyan
                : (isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight),
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

