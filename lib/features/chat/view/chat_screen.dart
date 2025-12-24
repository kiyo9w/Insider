import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/features/chat/view/conversation_screen.dart';
import 'package:insider/features/chat/view/chat_view.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';

/// Chat Screen - Main AI interaction interface with stunning input design
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatMode _chatMode = ChatMode.simpleQa;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, isDark),
            Expanded(
              child: ChatView(
                chatMode: _chatMode,
                onModeChanged: (mode) {
                  setState(() {
                    _chatMode = mode;
                  });
                },
                onSend: (message, mode) {
                  _handleSend(message, mode);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSystem.spacing16,
        vertical: DesignSystem.spacing12,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.go(AppRouter.threadsPath);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? DesignSystem.backgroundDarkElevated
                    : DesignSystem.backgroundLightElevated,
                border: Border.all(
                  color: isDark
                      ? DesignSystem.borderDark
                      : DesignSystem.borderLight,
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.person_outline,
                size: 22,
                color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.go(AppRouter.discoveryPath);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Back card
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(4.0, -2.0)
                      ..rotateZ(0.25), // Increased rotation
                    alignment: Alignment.center,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white
                                .withOpacity(0.15) // Increased opacity
                            : Colors.black.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withOpacity(0.4) // Distinct border
                              : Colors.black.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  // Front card
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(-2.0, 2.0)
                      ..rotateZ(-0.15),
                    alignment: Alignment.center,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF333333) // Distinct solid color
                            : const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: isDark
                              ? DesignSystem.iconDark
                              : DesignSystem.iconLight,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSend(String message, ChatMode mode) {
    FocusScope.of(context).unfocus(); // Ensure keyboard is hidden
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConversationScreen(
          query: message,
          chatMode: mode,
        ),
      ),
    );
  }
}
