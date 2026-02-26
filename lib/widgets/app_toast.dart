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
  final mediaQuery = MediaQuery.of(rootContext);
  final safeBottom = mediaQuery.padding.bottom;
  final isDark = Theme.of(rootContext).brightness == Brightness.dark;
  final screenWidth = mediaQuery.size.width;
  final baseToastWidth = (screenWidth - 32).clamp(260.0, screenWidth);
  final targetToastWidth = baseToastWidth * 0.85;
  final horizontalMargin = ((screenWidth - targetToastWidth) / 2)
      .clamp(16.0, screenWidth / 3)
      .toDouble();
  final isSuccess = resolvedType == AppToastType.success;

  const toastDuration = Duration(milliseconds: 2800);

  final accentColor =
      isSuccess ? const Color(0xFF07B11D) : const Color(0xFFE5484D);

  final backgroundColor = isDark
      ? const Color(0xFF070A0E)
      : (isSuccess ? const Color(0xFFEAF8ED) : const Color(0xFFFCECEE));
  final textColor = isDark ? Colors.white : const Color(0xFF232323);
  final closeColor = isDark ? const Color(0xFFB7B7B7) : const Color(0xFF676767);

  final trackColor = isSuccess
      ? (isDark ? const Color(0xFF113D18) : const Color(0xFFCBEBD1))
      : (isDark ? const Color(0xFF4B1E22) : const Color(0xFFF6CCD0));

  late Flushbar<void> flushbar;

  flushbar = Flushbar<void>(
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.fromLTRB(
      horizontalMargin,
      0,
      horizontalMargin,
      safeBottom + 12,
    ),
    borderRadius: BorderRadius.circular(14),
    duration: toastDuration,
    animationDuration: const Duration(milliseconds: 220),
    forwardAnimationCurve: Curves.easeOutCubic,
    reverseAnimationCurve: Curves.easeInCubic,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
    messageText: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isSuccess ? Icons.check_rounded : Icons.close_rounded,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message,
                      style: DesignSystem.bodyLarge.copyWith(
                        color: textColor,
                        fontWeight: DesignSystem.medium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => flushbar.dismiss(),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.close_rounded,
                        color: closeColor,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: trackColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            height: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1, end: 0),
                duration: toastDuration,
                curve: Curves.linear,
                builder: (context, value, _) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: value,
                      child: Container(color: accentColor),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );

  return flushbar.show(rootContext);
}
