import 'package:ayn/constants/colors.dart';
import 'package:flutter/material.dart';

class DalelContainer extends StatelessWidget {
  DalelContainer({
    super.key,
    required this.dalelName,
    required this.move,
    required this.imagePath,
  });
  String dalelName;
  String imagePath;
  Function move;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        move();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: MediaQuery.sizeOf(context).width * 0.35,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ////The code that I have added
            SizedBox(width: 50, child: Image.asset(imagePath)),
            ////////
            Text(
              dalelName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: white),
            ),
          ],
        ),
      ),
    );
  }
}
