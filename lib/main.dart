import 'package:ayn/Screens/boxes_screen.dart';
import 'package:ayn/Screens/kuflaa_data_screen.dart';
import 'package:ayn/Screens/pos_screen.dart';
import 'package:ayn/Screens/post_content.dart';
import 'package:ayn/Screens/posts_titles_screen.dart';
import 'package:ayn/Screens/home_screen.dart';
import 'package:ayn/Screens/management_dalel_screen.dart';
import 'package:ayn/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayn Guide',
      theme: ThemeData(
        fontFamily: "ReadexPro",
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: white,
          secondary: secondary,
          onSecondary: darkGray,
          error: red,
          onError: white,
          surface: white,
          onSurface: darkGray,
        ),
      ),
      routes: {
        "home": (context) => HomePage(),
        "management": (context) => ManagementDalelScreen(),
        "boxes": (context) => BoxesScreen(),
        "postsTitles": (context) => PostsTitlesScreen(),
        "postContent": (context) => PostContentScreen(),
        "pos": (context) => PosScreen(),
        "kuflaa": (context) => KuflaaDataScreen(),
      },
      home: HomePage(),
    );
  }
}
