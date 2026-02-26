import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:insider/core/design_system/design_system.dart';

enum AppToastType { success, error }

Future<void> showAppToast(
  BuildContext context, {
  required String message,
  AppToastType type = AppToastType.success,
  bool isError = false,
}) {
  final resolvedType = isError ? AppToastType.error : type;
  final rootContext = Navigator.of(context, rootNavigator: true).context;
  final isDark = Theme.of(rootContext).brightness == Brightness.dark;
  final topInset = MediaQuery.of(rootContext).padding.top;

  final isSuccess = resolvedType == AppToastType.success;

  final backgroundColor =
      isDark ? const Color(0xFF070A0E) : const Color(0xFFF1F1F1);

  final textColor = isDark ? Colors.white : const Color(0xFF696969);

  final accentColor =
      isSuccess ? const Color(0xFF07B11D) : const Color(0xFFE5484D);

  final progressBgColor = isSuccess
      ? (isDark ? const Color(0xFF123F1A) : const Color(0xFFD8F2DB))
      : (isDark ? const Color(0xFF4B1E22) : const Color(0xFFF8D7D9));

  late Flushbar<void> flushbar;

  flushbar = Flushbar<void>(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.fromLTRB(16, topInset + 10, 16, 0),
    borderRadius: BorderRadius.circular(14),
    duration: const Duration(milliseconds: 2800),
    backgroundColor: backgroundColor,
    boxShadows: const [
      BoxShadow(
        color: Color(0x29000000),
        blurRadius: 20,
        offset: Offset(0, 8),
      ),
    ],
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: progressBgColor,
    progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(accentColor),
    icon: Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: accentColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isSuccess ? Icons.check_rounded : Icons.close_rounded,
        size: 26,
        color: Colors.white,
      ),
    ),
    mainButton: IconButton(
      splashRadius: 18,
      iconSize: 24,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minHeight: 28, minWidth: 28),
      onPressed: () => flushbar.dismiss(),
      icon: Icon(
        Icons.close_rounded,
        color: isDark ? const Color(0xFFD5D5D5) : const Color(0xFFA2A2A2),
      ),
    ),
    messageText: Text(
      message,
      style: DesignSystem.bodyLarge.copyWith(
        color: textColor,
        fontWeight: DesignSystem.medium,
        fontSize: 18,
      ),
    ),
  );

  return flushbar.show(rootContext);
}
