import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/app/bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/generated/l10n.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int _selectedTheme = 0;

  @override
  void initState() {
    super.initState();
    final isDarkMode = context.read<AppBloc>().state.isDarkMode;
    _selectedTheme = isDarkMode ? 2 : 1;
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
                    _buildThemePreview(isDark),
                    const SizedBox(height: 24),
                    _buildThemeSelector(isDark),
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
              S.current.theme_title,
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

  Widget _buildThemePreview(bool isDark) {
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
                color:
                    isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
                width: 1,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: isDark
                  ? DesignSystem.backgroundDarkCard
                  : DesignSystem.backgroundLightCard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
                width: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSelector(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildThemeOption(
            S.current.theme_system,
            0,
            isDark,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildThemeOption(
            S.current.theme_light,
            1,
            isDark,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildThemeOption(
            S.current.theme_dark,
            2,
            isDark,
          ),
        ),
      ],
    );
  }

  Widget _buildThemeOption(String label, int index, bool isDark) {
    final isSelected = _selectedTheme == index;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() {
          _selectedTheme = index;
        });

        final isDarkMode = context.read<AppBloc>().state.isDarkMode;
        if ((index == 1 && isDarkMode) || (index == 2 && !isDarkMode)) {
          context.read<AppBloc>().add(
                const AppEvent.darkModeChanged(),
              );
        }
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
                : (isDark ? DesignSystem.borderDark : DesignSystem.borderLight),
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
