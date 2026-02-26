import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:insider/core/design_system/design_system.dart';

Future<void> showAppToast(
  BuildContext context, {
  required String message,
  bool isError = false,
}) {
  final rootContext = Navigator.of(context, rootNavigator: true).context;
  final isDark = Theme.of(rootContext).brightness == Brightness.dark;
  final topInset = MediaQuery.of(rootContext).padding.top;

  final backgroundColor = isError
      ? const Color(0xFFB42318)
      : (isDark ? const Color(0xFF1F1F1F) : const Color(0xFF111111));

  return Flushbar<void>(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.fromLTRB(16, topInset + 10, 16, 0),
    borderRadius: BorderRadius.circular(14),
    duration: const Duration(seconds: 3),
    backgroundColor: backgroundColor,
    boxShadows: const [
      BoxShadow(
        color: Color(0x33000000),
        blurRadius: 20,
        offset: Offset(0, 8),
      ),
    ],
    icon: Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isError ? Icons.error_outline_rounded : Icons.check_rounded,
        size: 16,
        color: Colors.white,
      ),
    ),
    messageText: Text(
      message,
      style: DesignSystem.bodySmall.copyWith(
        color: Colors.white,
        fontWeight: DesignSystem.medium,
        fontSize: 14,
      ),
    ),
  ).show(rootContext);
}
