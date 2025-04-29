import 'package:flutter/material.dart';

class ResponsiveTextFormField extends StatelessWidget {
  const ResponsiveTextFormField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    required this.child,
  });

  final String? hintText;
  final int maxLines;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            child: child);
      },
    );
  }
}
