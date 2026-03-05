import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/widgets/app_toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _currentPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
    _currentPasswordController.addListener(() {
      setState(() {});
    });
    _newPasswordController.addListener(() {
      setState(() {});
    });
    _confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _currentPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
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
      listenWhen: (prev, curr) => prev.error != curr.error,
      listener: (context, state) {
        if (state.error != null && state.error!.isNotEmpty) {
          showAppToast(
            context,
            message: state.error!,
            isError: true,
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
                          S.current.change_password_title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          S.current.change_password_instruction,
                          style: DesignSystem.bodyMedium.copyWith(
                            color: isDark
                                ? DesignSystem.textSecondaryDark
                                : DesignSystem.textSecondaryLight,
                            fontSize: 14,
                          ),
                        ),
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
                          controller: _currentPasswordController,
                          focusNode: _currentPasswordFocusNode,
                          hint: S.current.current_password_hint,
                          isDark: isDark,
                          inputColor: inputColor,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        _buildInput(
                          controller: _newPasswordController,
                          focusNode: _newPasswordFocusNode,
                          hint: S.current.new_password_hint,
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
        onSubmitted: (_) => isLast ? _handleChangePassword(context) : null,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, bool isDark) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final hasEmail = _emailController.text.trim().isNotEmpty;
        final hasCurrentPwd = _currentPasswordController.text.isNotEmpty;
        final hasNewPwd = _newPasswordController.text.isNotEmpty;
        final hasConfirmPwd = _confirmPasswordController.text.isNotEmpty;
        final isEnabled = hasEmail &&
            hasCurrentPwd &&
            hasNewPwd &&
            hasConfirmPwd &&
            !state.isLoading;

        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isEnabled ? () => _handleChangePassword(context) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignSystem.primaryCyan,
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
                    S.current.change_password_action,
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

  Future<void> _handleChangePassword(BuildContext context) async {
    final email = _emailController.text.trim();
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty ||
        currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      return;
    }

    if (newPassword != confirmPassword) {
      showAppToast(
        context,
        message: S.current.passwords_do_not_match,
        isError: true,
      );
      return;
    }

    HapticFeedback.lightImpact();
    final success = await context.read<AuthCubit>().changePassword(
          email: email,
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

    if (success && context.mounted) {
      Navigator.pop(context);
      showAppToast(
        context,
        message: S.current.change_password_success,
      );
    }
  }
}
