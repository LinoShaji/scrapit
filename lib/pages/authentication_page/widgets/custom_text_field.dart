import 'package:flutter/material.dart';

class CustomAuthenticationTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomAuthenticationTextField(
      {required this.controller, super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
