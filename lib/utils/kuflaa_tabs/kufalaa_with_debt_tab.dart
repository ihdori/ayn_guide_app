import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KufalaaWithDebtTab extends ConsumerWidget {
  KufalaaWithDebtTab({super.key, required this.data});

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context, ref) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final kafeel = data[index];

        return ListTile(title: Text(kafeel['kafeel_name']), onTap: () {});
      },
    );
  }
}
