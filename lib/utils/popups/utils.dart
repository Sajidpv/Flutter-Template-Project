import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:erp/cors/configs/app_strings.dart';

class Utils {
  // we will use this function to shift focus from one text field to another text field
  // we are using to avoid duplications of code
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // generic toast message imported from toast package
  // we will utilise this for showing errors or success messages
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontAsset: 'assets/fonts/mono/CascadiaMono.ttf',
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  //imported this from flush bar package
  // we will utilise this for showing errors or success messages
  static void flushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.error, size: 28, color: Colors.white),
      )..show(context),
    );
  }

  // we will utilise this for showing errors or success messages
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red, content: Text(message)),
    );
  }

  static void handleApiError(String error, BuildContext context) {
    try {
      final errorData = jsonDecode(error);
      final errorMessage =
          errorData['message'] ?? errorData['error'] ?? AppStrings.unknownerror;
      Utils.flushBarMessage(errorMessage, context);
    } catch (e) {
      Utils.flushBarMessage(AppStrings.errorMessage, context);
    }
  }

  static String timerFormatting(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  static String extractDate(DateTime dateTime, {int daysToAdd = 0}) {
    DateTime updatedDate = dateTime.add(Duration(days: daysToAdd));
    return DateFormat('yyyy-MM-dd').format(updatedDate);
  }

  /////////////Share Options////////////////////

  // static shareContent({
  //   required BuildContext context,
  //   String? text,
  //   String? subject,
  //   List<XFile>? filePaths,
  // }) {
  //   final box = context.findRenderObject() as RenderBox?;
  //   if (filePaths != null && filePaths.isNotEmpty) {
  //     Share.shareXFiles(
  //       filePaths,
  //       text: text,
  //       subject: subject,
  //       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  //     );
  //   } else if (text != null) {
  //     Share.share(
  //       text,
  //       subject: subject,
  //       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  //     );
  //   } else {
  //     throw ArgumentError('Either text or filePaths must be provided.');
  //   }
  // }
}
