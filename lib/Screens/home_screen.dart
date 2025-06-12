import 'package:ayn/Screens/kuflaa_screen.dart';
import 'package:ayn/providers/bottom_nav_bar_provider.dart';
import 'package:ayn/utils/temp_plceholder.dart';
import 'package:ayn/utils/bottom_nav_bar.dart';
import 'package:ayn/utils/home_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  List<Widget> screens = [
    KuflaaScreen(),
    HomeWidget(),
    TempPlaceHolderScreen(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("دليل المندوب"), centerTitle: true),
      body: screens[ref.watch(curentIndexProivder)],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
