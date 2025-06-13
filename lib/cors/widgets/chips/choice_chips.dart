import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/utils/constants/colors.dart';
import 'package:firebaseapp/utils/constants/sizes.dart';

class SChoiceChips extends StatelessWidget {
  const SChoiceChips({
    super.key,
    required this.text,
    required this.isSelected,
    this.onSelected,
  });
  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ChoiceChip(
        showCheckmark: false,
        label: Text(text).toCenter(),
        side: BorderSide.none,
        selected: isSelected,
        onSelected: onSelected,
        selectedColor: AppPellet.purple,
        backgroundColor: AppPellet.grey.withValues(alpha: .3),
        labelStyle: context.bodyMedium?.copyWith(
          color:
              isSelected
                  ? AppPellet.white
                  : AppPellet.grey.withValues(alpha: .5),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        labelPadding: EdgeInsets.zero,
      ),
    ).paddingAll(5);
  }
}
