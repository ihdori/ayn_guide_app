import 'package:ayn/providers/app_bar_title_provider.dart';
import 'package:ayn/providers/catigory_id_provider.dart';
import 'package:ayn/providers/subcatigory_id_provider.dart';
import 'package:ayn/providers/table_name_provider.dart';
import 'package:ayn/utils/dalel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PosScreen extends ConsumerWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('دليل المستحصل'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "الكوبونات",
              move: () {},
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/kafala.png',
              dalelName: "الكفالات",
              move: () {},
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/ayn.png',
              dalelName: "الصناديق",
              move: () {},
            ),
            DalelContainer(
              imagePath: 'assets/images/app_icons/campagin.png',
              dalelName: "الحملات",
              move: () {
                ref.read(catigoryId.notifier).state = 2;
                ref.read(subcatigoryId.notifier).state = 2;
                ref.read(tableNameProvider.notifier).state = "pos_tutorials";
                print(ref.watch(tableNameProvider));
                ref.read(appBatTitleProvider.notifier).state = "الحملات";
                Navigator.pushNamed(context, 'postsTitles');
              },
            ),
          ],
        ),
      ),
    );
  }
}
