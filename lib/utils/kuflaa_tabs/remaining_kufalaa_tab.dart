import 'package:ayn/providers/db_provider.dart';
import 'package:ayn/providers/kufalaa_providers/contacted_kufalaa_provider.dart';
import 'package:ayn/providers/kufalaa_providers/has_debt_kufalaa_provider.dart';
import 'package:ayn/providers/kufalaa_providers/remaining_kufalaa_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemainingKufalaaTab extends ConsumerWidget {
  RemainingKufalaaTab({super.key, required this.data});

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context, ref) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final kafeel = data[index];

        return ListTile(
          leading: Checkbox(
            value: false,
            onChanged: (value) async {
              final db = await ref.read(kufalaaDbProvider.future);
              await db.rawUpdate(
                'UPDATE all_kufalaa SET category_id = 2 WHERE id = ${data[index]['id']}',
              );
              ref.invalidate(remainingKufalaaProvider);
              ref.invalidate(contactedKufalaaProvider);
              ref.invalidate(KufalaaWithDebtProvider);
            },
          ),
          title: Text(kafeel['kafeel_name']),
          onTap: () {},
        );
      },
    );
  }
}
