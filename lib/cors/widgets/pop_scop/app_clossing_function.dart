import 'dart:io';
import 'package:flutter/material.dart';
import 'package:erp/utils/popups/utils.dart';

class WillPopScopWidget extends StatefulWidget {
  const WillPopScopWidget({super.key, required this.child});

  final Widget child;

  @override
  State<WillPopScopWidget> createState() => _WillPopScopWidgetState();
}

class _WillPopScopWidgetState extends State<WillPopScopWidget> {
  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;

        DateTime now = DateTime.now();
        if (_lastPressed == null ||
            now.difference(_lastPressed!) > const Duration(seconds: 2)) {
          _lastPressed = now;
          Utils.toastMessage("Press back again to leave");
          return;
        }

        exit(0);
      },
      child: widget.child,
    );
  }
}
