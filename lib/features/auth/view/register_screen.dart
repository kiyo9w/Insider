import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/features/auth/view/email_signin_screen.dart';
import 'package:insider/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    _confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF1C1C1E) : Colors.white;
    final inputColor =
        isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF2F2F7);
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
                          S.current.create_account_title,
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
                        ),
                        const SizedBox(height: 16),
                        _buildInput(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                          hint: S.current.confirm_password_hint,
                          isDark: isDark,
                          inputColor: inputColor,
                          obscureText: true,
                          isLast: true,
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
                      _buildFooterText(context, isDark),
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
          color: isDark ? Colors.white : Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: isDark ? Colors.grey[600] : Colors.grey[500],
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        onSubmitted: (_) => isLast ? _handleRegister(context) : null,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, bool isDark) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final hasEmail = _emailController.text.trim().isNotEmpty;
        final hasPwd = _passwordController.text.isNotEmpty;
        final hasConfirmPwd = _confirmPasswordController.text.isNotEmpty;
        final isEnabled =
            hasEmail && hasPwd && hasConfirmPwd && !state.isLoading;

        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isEnabled ? () => _handleRegister(context) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? const Color(0xFF333333) : Colors.black,
              disabledBackgroundColor:
                  isDark ? const Color(0xFF222222) : Colors.grey[300],
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
                          : (isDark ? Colors.grey[600] : Colors.grey[500]),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildFooterText(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const EmailSignInScreen(),
        );
      },
      child: RichText(
        text: TextSpan(
          text: S.current.already_have_account,
          style: TextStyle(
            color: isDark ? Colors.grey[500] : Colors.grey[600],
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: S.current.sign_in_action,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegister(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty) return;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.current.passwords_do_not_match),
          backgroundColor: DesignSystem.error,
        ),
      );
      return;
    }

    HapticFeedback.lightImpact();
    context.read<AuthCubit>().register(email: email, password: password);
  }
}
