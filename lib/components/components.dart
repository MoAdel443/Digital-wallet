import 'package:flutter/material.dart';

Widget txtFromField(
    {IconButton? suffex,
    bool obsecure = false,
    required String hintText,
    required Icon prefixIcon,
    required String? Function(String?) validator,
    TextInputType keybordType = TextInputType.text,
    required TextEditingController emailController}) {
  return TextFormField(
    controller: emailController,
    keyboardType: keybordType,
    validator: validator,
    obscureText: obsecure,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      hintText: hintText,
      suffixIcon: suffex,
      border: OutlineInputBorder(),
    ),
  );
}
