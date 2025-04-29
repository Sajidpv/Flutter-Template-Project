import 'package:flutter/material.dart';

class CustomCircularIconButtonWidget extends StatelessWidget {
  const CustomCircularIconButtonWidget(
      {super.key,
      required this.icon,
      required this.color,
      required this.backgroudColor,
      required this.size,
      this.onIconPressed});
  final IconData icon;
  final Color color, backgroudColor;
  final double size;
  final void Function()? onIconPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onIconPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: backgroudColor),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
