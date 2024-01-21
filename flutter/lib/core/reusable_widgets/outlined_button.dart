import 'package:flutter/material.dart';

class DefaultOutlineButton extends StatelessWidget {
  DefaultOutlineButton({
    Key? key,
    required this.buttonLabel,
    required this.onPressed,
    this.height,
    this.width,
    this.buttonBackgroundColor,
    this.textStyle,
    this.icon,
  }) : super(key: key);

  final String buttonLabel;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color? buttonBackgroundColor;
  final TextStyle? textStyle;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.teal),
        ),
        icon: icon ?? Icon(Icons.add),
        label: Text(
          buttonLabel,
          style: textStyle,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
