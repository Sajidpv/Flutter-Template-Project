import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stock_shift_pro/utils/constants/colors.dart';
import 'package:stock_shift_pro/utils/constants/sizes.dart';
import 'package:stock_shift_pro/utils/extensions/constraints_extensions.dart';

class CustomContainerWidget extends StatelessWidget {
  final Widget? child;
  final double? radius;
  final double minWidth, maxWidth;

  final double? width, height, elevation;
  final bool showBorder, showShadow;
  final Color borderColor, backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final String? backgroundImage;

  const CustomContainerWidget({
    super.key,
    this.child,
    this.radius = AppSizes.cardRadiusSm,
    this.width,
    this.height,
    this.showBorder = false,
    this.showShadow = false,
    this.borderColor = AppPellet.borderPrimary,
    this.backgroundColor = AppPellet.white,
    this.margin,
    this.padding = const EdgeInsets.all(AppSizes.md),
    this.onTap,
    this.elevation,
    this.borderRadius,
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        borderRadius: borderRadius ?? BorderRadius.circular(radius!),
        color: backgroundColor,
        image:
            backgroundImage != null
                ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                )
                : null,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              color: AppPellet.grey.withValues(alpha: .1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 0),
            ),
        ],
      ),
      child: child,
    ).onTap(onTap ?? () {}).constrains(minWidth: minWidth, maxWidth: maxWidth);
  }
}
