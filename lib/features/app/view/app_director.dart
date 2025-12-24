import 'package:flutter/material.dart';
import 'package:insider/features/chat/view/chat_screen.dart';
import 'package:insider/features/main/view/main_shell.dart';

class AppDirector extends StatelessWidget {
  const AppDirector({super.key});

  @override
  Widget build(BuildContext context) {
    // Always show the main app - users can use as guest
    // Auth is optional and shown from settings/threads when needed
    return const MainShell(
      child: ChatScreen(),
    );
  }
}
