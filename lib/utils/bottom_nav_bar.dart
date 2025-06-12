import 'package:ayn/constants/colors.dart';
import 'package:ayn/providers/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return BottomNavigationBar(
      selectedItemColor: primary,

      onTap: (value) {
        ref.read(curentIndexProivder.notifier).state = value;
      },
      currentIndex: ref.watch(curentIndexProivder),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "الكفلاء"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "التحديثات",
        ),
      ],
    );
  }
}
