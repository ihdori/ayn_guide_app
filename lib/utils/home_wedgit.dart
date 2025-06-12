import 'package:ayn/utils/dalel_container.dart';
import 'package:ayn/utils/statistics_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.sizeOf(context).width),

          StatisticsContainer(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DalelContainer(
                imagePath: 'assets/images/app_icons/management.png',
                dalelName: "الدليل الاداري",
                move: () {
                  Navigator.pushNamed(context, 'management');
                },
              ),
              DalelContainer(
                imagePath: 'assets/images/app_icons/sharaa.png',
                dalelName: "الدليل الشرعي",
                move: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DalelContainer(
                imagePath: 'assets/images/app_icons/story-teslling.png',
                dalelName: "قصص معبرة",
                move: () {},
              ),
              DalelContainer(
                imagePath: 'assets/images/app_icons/ayn.png',
                dalelName: "معلومات عن المؤسسة",
                move: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // DalelContainer(dalelName: "الدليل\nالاداري", move: () {}),
              DalelContainer(
                imagePath: 'assets/images/app_icons/marketing.png',
                dalelName: "الدليل الترويجي",
                move: () {},
              ),
              DalelContainer(
                imagePath: 'assets/images/app_icons/pos.png',
                dalelName: "دليل المستحصل",
                move: () {
                  Navigator.pushNamed(context, "pos");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
