import 'package:ayn/constants/colors.dart';
import 'package:flutter/material.dart';

class KuflaaNumbers extends StatelessWidget {
  KuflaaNumbers({
    super.key,
    required this.number,
    required this.text,
    this.color = primary,
  });
  String text;
  int number;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.75),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 20)),
          Text(
            number.toString(),
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
