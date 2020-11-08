import 'package:flutter/material.dart';

class DefaultOutlineButton extends StatefulWidget {
  final String buttonLabel;
  final Function onPressed;
  final double height;
  final double width;
  final Color buttonBackgroundColor;
  final TextStyle textStyle;
  final Icon icon;
  DefaultOutlineButton({
    Key key,
    this.buttonLabel,
    this.onPressed,
    this.height,
    this.width,
    this.buttonBackgroundColor,
    this.textStyle,
    this.icon,
  }) : super(key: key);

  @override
  _DefaultOutlineButtonState createState() => _DefaultOutlineButtonState();
}

class _DefaultOutlineButtonState extends State<DefaultOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.buttonBackgroundColor ?? Colors.teal,
        borderRadius: BorderRadius.circular(10)
      ),
      height: widget.height,
      width: widget.width,
      child: OutlineButton.icon(
        icon: widget.icon ?? Icon(Icons.add),
        label: Text(
          widget.buttonLabel,
          style: widget.textStyle,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
