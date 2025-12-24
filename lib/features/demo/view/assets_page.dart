import 'package:insider/core/dimens/app_dimens.dart';
import 'package:insider/core/spacings/app_spacing.dart';
import 'package:insider/generated/assets.gen.dart';
import 'package:insider/generated/l10n.dart';
import 'package:flutter/material.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.assets),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.basePadding),
        child: Column(
          children: [
            Text(S.current.svg_format),
            AppSpacing.verticalSpacing24,
            Assets.icons.iconAstronomy.svg(),
            AppSpacing.verticalSpacing24,
            Text(S.current.png_format),
            Assets.images.lightVe.image(),
            AppSpacing.verticalSpacing24,
          ],
        ),
      ),
    );
  }
}
