import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function()? onTap;
  final bool readOnly;
  final bool obsecureText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onTap,
      this.readOnly = false,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
