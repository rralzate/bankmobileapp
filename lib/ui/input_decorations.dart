import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration formInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prtefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
        prefixIcon: prtefixIcon != null
            ? Icon(
                prtefixIcon,
                color: Colors.white,
              )
            : null);
  }
}
