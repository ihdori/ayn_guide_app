import 'package:flutter/material.dart';

class TempPlaceHolderScreen extends StatelessWidget {
  const TempPlaceHolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          "ستتم اضافة هذا القسم قريباً",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
