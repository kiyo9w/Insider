import 'package:flutter/material.dart';
import 'package:insider/features/main/view/tablet_main_screen.dart';

/// Main Shell - Responsive container that displays the appropriate layout
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return const TabletMainScreen();
        }
        return child;
      },
    );
  }
}
