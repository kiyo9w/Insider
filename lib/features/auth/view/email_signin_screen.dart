import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/features/auth/view/register_screen.dart';
import 'package:insider/generated/l10n.dart';

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({super.key});

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _forgotEmailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _forgotEmailController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight;
    final inputColor = isDark
        ? DesignSystem.backgroundDarkElevated
        : DesignSystem.backgroundLightElevated;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) =>
          prev.isAuthenticated != curr.isAuthenticated ||
          prev.error != curr.error,
      listener: (context, state) {
        if (state.isAuthenticated) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        } else if (state.error != null && state.error!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: DesignSystem.error,
            ),
          );
        }
      },
      child: Container(
        height: screenHeight * 0.8,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: isDark ? Colors.white : Colors.black,
                          size: 24,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Text(
                          S.current.sign_in_email_title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balance close button
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        _buildInput(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          hint: S.current.email_hint,
                          isDark: isDark,
                          inputColor: inputColor,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        _buildInput(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          hint: S.current.password_hint,
                          isDark: isDark,
                          inputColor: inputColor,
                          obscureText: true,
                          isLast: true,
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _showForgotPasswordSheet,
                            style: TextButton.styleFrom(
                              foregroundColor: DesignSystem.primaryCyan,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              S.current.forgot_password_question,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      _buildContinueButton(context, isDark),
                      const SizedBox(height: 16),
                      _buildFooterText(isDark),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required bool isDark,
    required Color inputColor,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: inputColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(
          color: isDark
              ? DesignSystem.textPrimaryDark
              : DesignSystem.textPrimaryLight,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: isDark
                ? DesignSystem.textSecondaryDark
                : DesignSystem.textSecondaryLight,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        onSubmitted: (_) => isLast ? _handleContinue(context) : null,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, bool isDark) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final hasEmail = _emailController.text.trim().isNotEmpty;
        final hasPwd = _passwordController.text.isNotEmpty;
        final isEnabled = hasEmail && hasPwd && !state.isLoading;

        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isEnabled ? () => _handleContinue(context) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignSystem.primaryCyan,
              disabledBackgroundColor: isDark
                  ? DesignSystem.backgroundDarkElevated
                  : DesignSystem.backgroundLightElevated,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: state.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    S.current.continue_button,
                    style: TextStyle(
                      color: isEnabled
                          ? Colors.white
                          : (isDark
                              ? DesignSystem.textTertiaryDark
                              : DesignSystem.textTertiaryLight),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildFooterText(bool isDark) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const RegisterScreen(),
        );
      },
      child: RichText(
        text: TextSpan(
          text: S.current.dont_have_account,
          style: TextStyle(
            color: isDark
                ? DesignSystem.textSecondaryDark
                : DesignSystem.textSecondaryLight,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: S.current.sign_up_action,
              style: TextStyle(
                color: DesignSystem.primaryCyan,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleContinue(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) return;

    HapticFeedback.lightImpact();
    context.read<AuthCubit>().login(email: email, password: password);
  }

  void _showForgotPasswordSheet() {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final backgroundColor = isDark
            ? DesignSystem.backgroundDarkElevated
            : DesignSystem.backgroundLightElevated;

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.current.forgot_password_title,
                            style: DesignSystem.headingSmall.copyWith(
                              color: isDark
                                  ? DesignSystem.textPrimaryDark
                                  : DesignSystem.textPrimaryLight,
                              fontWeight: DesignSystem.semiBold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: isDark
                                ? DesignSystem.iconDark
                                : DesignSystem.iconLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      S.current.forgot_password_instruction,
                      style: DesignSystem.bodyMedium.copyWith(
                        color: isDark
                            ? DesignSystem.textSecondaryDark
                            : DesignSystem.textSecondaryLight,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? DesignSystem.backgroundDark
                            : DesignSystem.backgroundLight,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark
                              ? DesignSystem.borderDark
                              : DesignSystem.borderLight,
                        ),
                      ),
                      child: TextField(
                        controller: _forgotEmailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: isDark
                              ? DesignSystem.textPrimaryDark
                              : DesignSystem.textPrimaryLight,
                        ),
                        decoration: InputDecoration(
                          hintText: S.current.email_hint,
                          hintStyle: TextStyle(
                            color: isDark
                                ? DesignSystem.textSecondaryDark
                                : DesignSystem.textSecondaryLight,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                S.current.feature_coming_soon(
                                  S.current.forgot_password_title,
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DesignSystem.primaryCyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          S.current.send_reset_link_button,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
