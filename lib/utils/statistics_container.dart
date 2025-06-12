import 'package:ayn/constants/colors.dart';
import 'package:ayn/utils/statistics_text_styles.dart';
import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 20,
      height: MediaQuery.sizeOf(context).height * 0.275,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 239, 250),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "احصائيات اليتامى",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: primary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("الايتام المحتضنين", style: statisticsdesribTextStyle()),
                  Text("99,833", style: statisticsDescribeNumTextStyle()),
                ],
              ),
              Column(
                children: [
                  Text("في الانتظار", style: statisticsdesribTextStyle()),
                  Text("1,420", style: statisticsDescribeNumTextStyle()),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "المكفولين كفالة خاصة",
                    style: statisticsdesribTextStyle(),
                  ),
                  Text("88,144", style: statisticsDescribeNumTextStyle()),
                ],
              ),
              Column(
                children: [
                  Text("من 2006 الى الآن", style: statisticsdesribTextStyle()),
                  Text("205,379", style: statisticsDescribeNumTextStyle()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
