import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.validator,
    this.textInputType,
    this.showPassword,
    this.maxLine,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? showPassword;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: this.validator,
      controller: this.controller,
      keyboardType: this.textInputType,
      obscureText: this.showPassword ?? false,
      maxLines: this.maxLine,
      decoration: InputDecoration(
        hintText: this.hint,
        prefixIcon: this.prefixIcon,
        labelText: this.label,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
