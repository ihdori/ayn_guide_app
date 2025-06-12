import 'package:ayn/providers/db_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allKufalaaProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final db = await ref.watch(kufalaaDbProvider.future);
  return await db.rawQuery("SELECT * FROM all_kufalaa");
});
