import 'package:ayn/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  CustomLargeButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = primary,
    this.textColor = white,
  });
  String text;
  Function onTap;
  Color color;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 65,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: TextStyle(fontSize: 22, color: textColor)),
      ),
    );
  }
}
