import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/auth/view/email_signin_screen.dart';
import 'package:insider/features/auth/view/register_screen.dart';
import 'package:insider/generated/assets.gen.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key, this.onLogin});

  final VoidCallback? onLogin;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DesignSystem.backgroundDarkCard
            : DesignSystem.backgroundLightCard,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (isDark ? Assets.images.darkVe : Assets.images.lightVe).image(
                width: 160,
                height: 48,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              Text(
                'Create an account for free',
                style: DesignSystem.bodyMedium.copyWith(
                  color: isDark
                      ? DesignSystem.textSecondaryDark
                      : DesignSystem.textSecondaryLight,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              _AuthButton(
                text: 'Sign in with email',
                icon: Icons.email_outlined,
                isDark: isDark,
                onTap: () {
                  if (context.mounted) {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const EmailSignInScreen(),
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              _AuthButton(
                text: 'Sign up with email',
                icon: Icons.person_add_outlined,
                isDark: isDark,
                onTap: () {
                  if (context.mounted) {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const RegisterScreen(),
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Single sign-on (SSO)',
                style: DesignSystem.bodyMedium.copyWith(
                  color: isDark
                      ? DesignSystem.textSecondaryDark
                      : DesignSystem.textSecondaryLight,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Privacy policy',
                    style: DesignSystem.caption.copyWith(
                      color: isDark
                          ? DesignSystem.textTertiaryDark
                          : DesignSystem.textTertiaryLight,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: isDark
                        ? DesignSystem.textTertiaryDark
                        : DesignSystem.textTertiaryLight,
                  ),
                  Text(
                    'Terms of service',
                    style: DesignSystem.caption.copyWith(
                      color: isDark
                          ? DesignSystem.textTertiaryDark
                          : DesignSystem.textTertiaryLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
