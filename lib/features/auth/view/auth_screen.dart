import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/auth/view/email_signin_screen.dart';
import 'package:insider/features/auth/view/register_screen.dart';
import 'package:insider/generated/assets.gen.dart';
import 'package:insider/router/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static final Uri _legalUri = Uri.parse('http://chimai.io');

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? DesignSystem.backgroundDark.withValues(alpha: 0.95)
          : DesignSystem.backgroundLight.withValues(alpha: 0.95),
      body: Stack(
        children: [
          _buildBackgroundBlur(isDark),
          SafeArea(
            child: Center(
              child: _buildAuthModal(context, isDark),
            ),
          ),
          _buildCloseButton(context, isDark),
        ],
      ),
    );
  }

  Widget _buildBackgroundBlur(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DesignSystem.backgroundDark.withValues(alpha: 0.98)
            : DesignSystem.backgroundLight.withValues(alpha: 0.98),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context, bool isDark) {
    return Positioned(
      top: 56,
      right: 24,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          context.go(AppRouter.settingPath);
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.close,
            size: 28,
            color: isDark
                ? DesignSystem.textSecondaryDark
                : DesignSystem.textSecondaryLight,
          ),
        ),
      ),
    );
  }

  Widget _buildAuthModal(BuildContext context, bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isDark
            ? DesignSystem.backgroundDarkCard
            : DesignSystem.backgroundLightCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.1),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogo(isDark),
          const SizedBox(height: 32),
          _buildTitle(isDark),
          const SizedBox(height: 48),
          _buildEmailButton(context, isDark),
          const SizedBox(height: 12),
          _buildRegisterButton(context, isDark),
          const SizedBox(height: 40),
          _buildFooter(context, isDark),
        ],
      ),
    );
  }

  Widget _buildLogo(bool isDark) {
    return Column(
      children: [
        (isDark ? Assets.images.darkVe : Assets.images.lightVe).image(
          width: 160,
          height: 48,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildTitle(bool isDark) {
    return Text(
      'Create an account for free',
      style: DesignSystem.bodyMedium.copyWith(
        color: isDark
            ? DesignSystem.textSecondaryDark
            : DesignSystem.textSecondaryLight,
        fontSize: 15,
      ),
    );
  }

  Widget _buildEmailButton(BuildContext context, bool isDark) {
    return _AuthButton(
      text: 'Sign in with email',
      icon: Icons.email_outlined,
      isDark: isDark,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const EmailSignInScreen(),
        );
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context, bool isDark) {
    return _AuthButton(
      text: 'Sign up with email',
      icon: Icons.person_add_outlined,
      isDark: isDark,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const RegisterScreen(),
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLink(
          text: 'Privacy policy',
          isDark: isDark,
          onTap: () => _openLegalUrl(context),
        ),
        Container(
          width: 1,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: isDark
              ? DesignSystem.textTertiaryDark
              : DesignSystem.textTertiaryLight,
        ),
        _FooterLink(
          text: 'Terms of service',
          isDark: isDark,
          onTap: () => _openLegalUrl(context),
        ),
      ],
    );
  }

  Future<void> _openLegalUrl(BuildContext context) async {
    final opened = await launchUrl(
      _legalUri,
      mode: LaunchMode.externalApplication,
    );
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open link')),
      );
    }
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({
    required this.text,
    required this.icon,
    required this.isDark,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: isDark
            ? DesignSystem.backgroundDarkElevated
            : DesignSystem.backgroundLightElevated,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onTap();
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : DesignSystem.textPrimaryLight,
                ),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: DesignSystem.bodyMedium.copyWith(
                    color: isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                    fontWeight: DesignSystem.semiBold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({
    required this.text,
    required this.isDark,
    required this.onTap,
  });

  final String text;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Text(
        text,
        style: DesignSystem.caption.copyWith(
          color: isDark
              ? DesignSystem.textTertiaryDark
              : DesignSystem.textTertiaryLight,
          fontSize: 12,
        ),
      ),
    );
  }
}
