import 'package:flutter/material.dart';
import 'package:firebaseapp/cors/widgets/buttons/material_button.dart';

Future<void> showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String action,
  String backAction = 'Cancel',
  required String content,
  required VoidCallback onConfirm,
  VoidCallback? onCancell,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                content,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed:
                      onCancell ??
                      () {
                        Navigator.of(context).pop();
                      },
                  child: Text(backAction),
                ),
              ),
              Expanded(
                child: MaterialButtonWidget(
                  title: action,
                  onPressed: onConfirm,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
