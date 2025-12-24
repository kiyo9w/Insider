import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/view/conversation_message.dart';
import 'package:insider/generated/l10n.dart';

class UserMessage extends StatelessWidget {
  final ConversationMessage message;
  final bool isDark;

  const UserMessage({
    super.key,
    required this.message,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: GestureDetector(
            onLongPressStart: (details) {
              _showContextMenu(context, details.globalPosition);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color:
                    isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE5E5EA),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Text(
                message.content,
                style: DesignSystem.bodyMedium.copyWith(
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : Colors.black, // Dark text on light grey
                  fontSize: 16,
                  height: 1.4, // Slightly tighter height for bubble
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showContextMenu(BuildContext context, Offset position) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        position & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      color: isDark ? const Color(0xFF2C2C2E) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      items: [
        PopupMenuItem<String>(
          value: 'copy',
          height: 40,
          child: Row(
            children: [
              Icon(
                Icons.copy_rounded,
                size: 18,
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
              ),
              const SizedBox(width: 12),
              Text(
                S.current.copy,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : DesignSystem.textPrimaryLight,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'edit',
          height: 40,
          child: Row(
            children: [
              Icon(
                Icons.edit_outlined,
                size: 18,
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
              ),
              const SizedBox(width: 12),
              Text(
                S.current.edit,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : DesignSystem.textPrimaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (selected == 'copy') {
      Clipboard.setData(ClipboardData(text: message.content));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S.current.copied_to_clipboard,
              style: TextStyle(color: isDark ? Colors.black : Colors.white),
            ),
            backgroundColor: isDark ? Colors.white : Colors.black,
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            width: 180,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      }
    } else if (selected == 'edit') {
      // Edit action - placeholder
    }
  }
}
