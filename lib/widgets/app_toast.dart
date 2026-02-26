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
  final bottomInset = mediaQuery.viewInsets.bottom;
  final safeBottom = mediaQuery.padding.bottom;
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
  final trackColor =
      isSuccess ? const Color(0xFF113D18) : const Color(0xFF4B1E22);

  late Flushbar<void> flushbar;

  flushbar = Flushbar<void>(
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.fromLTRB(
      horizontalMargin,
      0,
      horizontalMargin,
      (bottomInset > 0 ? bottomInset : safeBottom) + 12,
    ),
    borderRadius: BorderRadius.circular(14),
    duration: toastDuration,
    animationDuration: const Duration(milliseconds: 220),
    forwardAnimationCurve: Curves.easeOutCubic,
    reverseAnimationCurve: Curves.easeInCubic,
    backgroundColor: const Color(0xFF070A0E),
    padding: EdgeInsets.zero,
    messageText: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
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
                      color: Colors.white,
                      fontWeight: DesignSystem.medium,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => flushbar.dismiss(),
                  child: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.close_rounded,
                      color: Color(0xFFB7B7B7),
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: Container(
              height: 4,
              color: trackColor,
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
