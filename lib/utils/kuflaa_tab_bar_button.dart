import 'package:ayn/constants/colors.dart';
import 'package:ayn/providers/kuflaa_tab_bar_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KuflaaTabBarButton extends ConsumerWidget {
  KuflaaTabBarButton({
    super.key,
    required this.buttonIndex,
    required this.text,
  });
  int buttonIndex;
  String text;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: buttonIndex == ref.watch(kuflaaTabbarIndexProvider)
            ? primary
            : white,
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(
          color: buttonIndex == ref.watch(kuflaaTabbarIndexProvider)
              ? white
              : Colors.grey,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: buttonIndex == ref.watch(kuflaaTabbarIndexProvider)
              ? white
              : Colors.grey,
        ),
      ),
    );
  }
}
