import 'package:ayn/providers/db_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final KufalaaWithDebtProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final db = await ref.watch(kufalaaDbProvider.future);
  return await db.rawQuery("SELECT * FROM kufalaa_with_debt");
});
