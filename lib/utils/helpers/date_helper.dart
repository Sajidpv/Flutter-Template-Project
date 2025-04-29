import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHelper {
  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime.now().subtract(Duration(days: 10));
    final DateTime lastDate = DateTime.now().add(Duration(days: 10));

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: now,
    );

    return pickedDate;
  }

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy')
        .format(date); // Customize the date format as needed
  }
}

/*
*
*
* */
