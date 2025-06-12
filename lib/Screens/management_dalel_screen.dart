import 'package:ayn/utils/dalel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManagementDalelScreen extends ConsumerWidget {
  const ManagementDalelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("الدليل الاداري"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "ضوابط عقد\nالمؤسسة",
              move: () {},
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "الاخطاء المتكررة",
              move: () {},
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "اجراءات الصناديق",
              move: () {
                Navigator.pushNamed(context, "boxes");
              },
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "اجراءات الكفلاء",
              move: () {},
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "اجراءات التبرعات",
              move: () {},
            ),
          ],
        ),
      ),
    );
  }
}
