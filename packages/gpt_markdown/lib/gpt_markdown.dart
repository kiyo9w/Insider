library gpt_markdown;

import 'package:flutter/material.dart';

typedef SourceTagBuilder = Widget Function(
  BuildContext context,
  String content,
  TextStyle? style,
);

class GptMarkdown extends StatelessWidget {
  const GptMarkdown(
    this.data, {
    super.key,
    this.style,
    this.sourceTagBuilder,
  });

  final String data;
  final TextStyle? style;
  final SourceTagBuilder? sourceTagBuilder;

  static final RegExp _citationRegex = RegExp(r'(\[\d+(?:,\s*\d+)*\])');

  @override
  Widget build(BuildContext context) {
    final spans = <InlineSpan>[];
    final parts = data.split(_citationRegex);

    for (final part in parts) {
      if (part.isEmpty) continue;
      final match = _citationRegex.firstMatch(part);
      final isCitation = match != null && match.group(0) == part;

      if (isCitation && sourceTagBuilder != null) {
        final content = part.substring(1, part.length - 1);
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: sourceTagBuilder!(context, content, style),
            ),
          ),
        );
      } else {
        spans.add(TextSpan(text: part, style: style));
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
