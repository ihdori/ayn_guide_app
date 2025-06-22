import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.lable,
    required this.hint,
    this.textInputType = TextInputType.text,
    required this.controller,
    required this.validator,
  });
  String lable;
  String hint;
  TextInputType textInputType;
  TextEditingController controller;
  Function validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'الحقل فارغ';
          } else if (value.length < 8) {
            return "يجب كتابة المعلومات بشكل كامل";
          }
          return null;
        },
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
