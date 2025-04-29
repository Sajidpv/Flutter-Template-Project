import 'package:flutter/material.dart';

class SDialogues {
  static defaultConfirmationDialog(
      {required BuildContext context,
      String title = 'Removal Confirmation',
      String content =
          'Removing this data will delete all the related data! are you sure?',
      String cancelText = 'Cancel',
      String confirmText = 'Remove',
      Function()? onCancell,
      Function()? onConfirm}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: onCancell ?? () => Navigator.pop(context),
                  child: Text(cancelText)),
              TextButton(onPressed: onConfirm, child: Text(confirmText))
            ],
          );
        });
  }
}
