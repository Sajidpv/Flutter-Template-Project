import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stock_shift_pro/utils/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    this.validator,
    required this.hintText,
    this.textInputType,
    this.onChanged,
    this.readOnly = false,
    this.suffix,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.isIgnore = false,
    this.prefix,
    this.maxLine,
    this.isBorder = true,
    this.fillColor,
    this.focusNode,
    this.onPressed,
    this.isActionButton = false,
    this.style,
  });
  final FocusNode? focusNode;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function? onChanged, onTap;
  final String hintText;
  final TextInputType? textInputType;
  final bool readOnly, isActionButton;
  final bool? isIgnore, isBorder;
  final int? maxLine;
  final IconData? suffix;
  final IconData? prefix;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final void Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isIgnore ?? false,
      child: Stack(
        children: [
          TextFormField(
            focusNode: focusNode,
            onTap: () {
              textController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: textController.text.length,
              );
              onTap?.call();
            },
            validator: validator,
            readOnly: readOnly,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            controller: textController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: style ?? context.bodyMedium,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
            maxLines: maxLine ?? 1,
            decoration: InputDecoration(
              fillColor: fillColor,
              prefix: prefix != null ? Icon(prefix, size: 15) : null,
              border: isBorder == false ? InputBorder.none : null,
              enabledBorder: isBorder == false ? InputBorder.none : null,
              focusedBorder: isBorder == false ? InputBorder.none : null,
              errorBorder: isBorder == false ? InputBorder.none : null,
              hintText: hintText,
              suffix: suffix == null ? null : Icon(suffix),
            ),
          ),
          if (onPressed != null && isActionButton)
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.new_label_rounded,
                  color: AppPellet.primary.withValues(alpha: .7),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
