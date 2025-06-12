import 'package:ayn/providers/app_bar_title_provider.dart';
import 'package:ayn/providers/catigory_id_provider.dart';
import 'package:ayn/providers/subcatigory_id_provider.dart';
import 'package:ayn/utils/dalel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoxesScreen extends ConsumerWidget {
  const BoxesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("اجراءات الصناديق"), centerTitle: true),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DalelContainer(
            imagePath: 'assets/images/app_icons/pos.png',
            dalelName: "ابطال الوصولات",
            move: () {
              ref.read(catigoryId.notifier).state = 1;
              ref.read(subcatigoryId.notifier).state = 1;
              ref.read(appBatTitleProvider.notifier).state = "اجراءات الصناديق";

              Navigator.pushNamed(context, "postsTitles");
            },
          ),
          DalelContainer(
            imagePath: 'assets/images/app_icons/ayn.png',
            dalelName: "الصناديق المفقودة",
            move: () {},
          ),
        ],
      ),
    );
  }
}
