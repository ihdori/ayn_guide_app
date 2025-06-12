import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.lable,
    required this.hint,
    this.textInputType = TextInputType.text,
    required this.controller,
  });
  String lable;
  String hint;
  TextInputType textInputType;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        style: TextStyle(fontSize: 18),
        controller: controller,
        keyboardType: textInputType,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[300]),
          label: Text(lable),
          labelStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.7),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
