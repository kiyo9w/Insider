import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/core/spacings/app_spacing.dart';
import 'package:insider/features/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/generated/l10n.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.current.intro_title),
            AppSpacing.verticalSpacing32,
            ElevatedButton(
              key: const Key(WidgetKeys.introStartedButtonKey),
              onPressed: () {
                context.read<AppBloc>().add(const AppEvent.disableFirstUse());
              },
              child: Text(S.current.started_button),
            ),
          ],
        ),
      ),
    );
  }
}
