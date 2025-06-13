import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/utils/constants/colors.dart';
import 'package:firebaseapp/utils/constants/sizes.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    this.title,
    this.onPressed,
    this.color = AppPellet.primary,
    this.textColor = AppPellet.white,
    this.padding,
    this.shape,
    this.leading,
    this.elevation = 0,
    this.mainAxisSize = MainAxisSize.max,
    this.radius = AppSizes.borderRadiusMd,
    this.trailing,
    this.height,
    this.textStyle,
  });
  final String? title;
  final Color color, textColor;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Widget? leading, trailing;
  final MainAxisSize mainAxisSize;
  final double elevation, radius;
  final double? height;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      padding: padding,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      height: height ?? AppSizes.buttonHeight,
      onPressed: onPressed,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        spacing: AppSizes.defaultSpace / 2,
        children: [
          if (leading != null) leading!,
          if (title != null)
            Text(
              title ?? '',
              style: textStyle ?? context.bodyLarge!.copyWith(color: textColor),
            ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
