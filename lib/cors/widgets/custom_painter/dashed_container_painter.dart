import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebaseapp/utils/constants/colors.dart';
import 'package:firebaseapp/utils/constants/sizes.dart';

class DashedBordfirebaseappainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color =
              AppPellet
                  .grey // Border color
          ..style = PaintingStyle.stroke
          ..strokeWidth = .8; // Border width

    final double dashWidth = 3; // Width of each dash
    final double dashSpace = 4; // Space between dashes
    final double radius = AppSizes.cardRadiusSm; // Radius for corners

    // Create a path for the rounded rectangle
    Path path =
        Path()
          ..moveTo(radius, 0)
          ..lineTo(size.width - radius, 0)
          ..arcTo(
            Rect.fromCircle(
              center: Offset(size.width - radius, radius),
              radius: radius,
            ),
            -90 * (3.14 / 180),
            90 * (3.14 / 180),
            false,
          )
          ..lineTo(size.width, size.height - radius)
          ..arcTo(
            Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius,
            ),
            0,
            90 * (3.14 / 180),
            false,
          )
          ..lineTo(radius, size.height)
          ..arcTo(
            Rect.fromCircle(
              center: Offset(radius, size.height - radius),
              radius: radius,
            ),
            90 * (3.14 / 180),
            90 * (3.14 / 180),
            false,
          )
          ..lineTo(0, radius)
          ..arcTo(
            Rect.fromCircle(center: Offset(radius, radius), radius: radius),
            180 * (3.14 / 180),
            90 * (3.14 / 180),
            false,
          )
          ..close();

    // Draw the dashed border
    _drawDashedBorder(canvas, paint, path, dashWidth, dashSpace);
  }

  void _drawDashedBorder(
    Canvas canvas,
    Paint paint,
    Path path,
    double dashWidth,
    double dashSpace,
  ) {
    double totalLength = 0.0;
    // Calculate the total length of the path
    for (PathMetric metric in path.computeMetrics()) {
      totalLength += metric.length;
    }

    // Draw dashes along the path
    double start = 0;
    while (start < totalLength) {
      // Calculate the start and end points for each dash
      double end = start + dashWidth;
      // Extract the path for the current dash
      PathMetrics metrics = path.computeMetrics();
      for (PathMetric metric in metrics) {
        final Path extractedPath = metric.extractPath(start, end);
        canvas.drawPath(extractedPath, paint);
      }
      start += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
