import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:erp/utils/constants/app_images.dart';
import 'package:erp/utils/constants/sizes.dart';
import 'package:erp/utils/extensions/spacer_extension.dart';

class LogoWithTitle extends StatelessWidget {
  final String title, subText;
  final List<Widget> children;

  const LogoWithTitle({
    super.key,
    required this.title,
    this.subText = '',
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                // Optional: ensures height behaves naturally
                child: Column(
                  children: [
                    (constraints.maxHeight * 0.1).height,
                    Image.asset(AppImages.appTransparentLogo, width: 170),
                    Text(title, style: context.headlineLarge),
                    (AppSizes.defaultSpace * 2).height,
                    Text(subText, style: context.headlineMedium),
                    (AppSizes.defaultSpace * 2).height,
                    ...children,
                  ],
                ),
              ),
            ).paddingHorizontal(AppSizes.defaultSpace),
          );
        },
      ),
    );
  }
}
