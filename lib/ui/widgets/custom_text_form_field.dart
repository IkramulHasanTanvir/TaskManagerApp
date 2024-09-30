import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    required this.hintText,
    this.maxLines = 1,
  });

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
