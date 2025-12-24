import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/features/auth/view/auth_bottom_sheet.dart';
import 'package:insider/generated/assets.gen.dart';
import 'package:insider/router/app_router.dart';

class TabletNavigationRail extends StatelessWidget {
  const TabletNavigationRail({
    super.key,
    required this.isDark,
    required this.isPortrait,
    required this.selectedIndex,
    required this.onLogoTap,
    required this.onNewChatTap,
    required this.onHomeTap,
    required this.onDiscoverTap,
    this.isThreadsActive = false,
  });

  final bool isDark;
  final bool isPortrait;
  final int selectedIndex;
  final VoidCallback onLogoTap;
  final VoidCallback onNewChatTap;
  final VoidCallback onHomeTap;
  final VoidCallback onDiscoverTap;
  final bool isThreadsActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: isDark
            ? DesignSystem.backgroundDarkElevated
            : DesignSystem.backgroundLightElevated,
        border: Border(
          right: BorderSide(
            color: isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Logo (acts as hamburger to toggle sidebar)
          GestureDetector(
            onTap: onLogoTap,
            child: (isDark
                    ? Assets.images.darkLOGOMARKPng
                    : Assets.images.lightLOGOMARKPng)
                .image(
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(height: 32),

          // New Chat Button
          _RailIconButton(
            icon: Icons.add,
            isDark: isDark,
            onTap: onNewChatTap,
            isPrimary: true,
          ),
          const SizedBox(height: 24),

          // Navigation Items
          _RailIconButton(
            icon: Icons.search,
            label: 'Threads',
            isDark: isDark,
            isSelected: selectedIndex == 0 && isThreadsActive,
            onTap: onHomeTap,
          ),
          const SizedBox(height: 16),
          _RailIconButton(
            icon: Icons.public, // Fallback
            label: 'Discover',
            isDark: isDark,
            isSelected: selectedIndex == 1,
            onTap: onDiscoverTap,
            customIcon: Stack(
              alignment: Alignment.center,
              children: [
                // Back card
                Transform(
                  transform: Matrix4.identity()
                    ..translate(4.0, -2.0)
                    ..rotateZ(0.25),
                  alignment: Alignment.center,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.15)
                          : Colors.black.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withOpacity(0.4)
                            : Colors.black.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                // Front card
                Transform(
                  transform: Matrix4.identity()
                    ..translate(-2.0, 2.0)
                    ..rotateZ(-0.15),
                  alignment: Alignment.center,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF333333)
                          : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: (selectedIndex == 1)
                            ? (isDark ? Colors.white : Colors.black)
                            : (isDark
                                ? DesignSystem.iconDark
                                : DesignSystem.iconLight),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Spacer to push avatar to bottom
          const Spacer(),
          // Avatar (and settings) at bottom of navigation rail
          Column(
            children: [
              _UserAvatar(isDark: isDark),
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  color:
                      isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                ),
                onPressed: () => context.push(AppRouter.settingPath),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RailIconButton extends StatelessWidget {
  const _RailIconButton({
    required this.icon,
    required this.isDark,
    required this.onTap,
    this.label,
    this.isSelected = false,
    this.isPrimary = false,
    this.customIcon,
  });

  final IconData icon;
  final bool isDark;
  final VoidCallback onTap;
  final String? label;
  final bool isSelected;
  final bool isPrimary;
  final Widget? customIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: isPrimary
              ? (isDark ? DesignSystem.backgroundDarkElevated : Colors.white)
              : Colors.transparent,
          shape: CircleBorder(
            side: isPrimary
                ? BorderSide(
                    color: isDark ? DesignSystem.borderDark : Colors.black12,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: isSelected
                  ? BoxDecoration(
                      color: isDark
                          ? DesignSystem.backgroundDarkElevated
                          : Colors.black.withOpacity(0.05),
                      shape: BoxShape.circle,
                    )
                  : null,
              child: customIcon ??
                  Icon(
                    icon,
                    size: 24,
                    color: isSelected
                        ? (isDark ? Colors.white : Colors.black)
                        : (isDark
                            ? DesignSystem.iconDark
                            : DesignSystem.iconLight),
                  ),
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 4),
          Text(
            label!,
            style: DesignSystem.captionSmall.copyWith(
              color: isSelected
                  ? (isDark ? Colors.white : Colors.black)
                  : (isDark
                      ? DesignSystem.textTertiaryDark
                      : DesignSystem.textTertiaryLight),
              fontSize: 10,
            ),
          ),
        ],
      ],
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _handleAuthNavigation(context, AppRouter.accountPath),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? DesignSystem.backgroundDarkElevated
                  : DesignSystem.backgroundLightElevated,
            ),
            child: Icon(
              Icons.person_outline,
              size: 24,
              color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
            ),
          ),
        );
      },
    );
  }

  void _handleAuthNavigation(BuildContext context, String route) {
    final authState = context.read<AuthCubit>().state;
    if (authState.isAuthenticated) {
      context.push(route);
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const AuthBottomSheet(),
      );
    }
  }
}
