import 'package:ayn/data/kuflaa_db.dart';
import 'package:ayn/data/sql_db.dart';
import 'package:ayn/services/kafeel_monthly_reseting_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbProvider = FutureProvider((ref) async {
  final db = await DatabaseHelper().database;
  return db;
});

final kufalaaDbProvider = FutureProvider((ref) async {
  final db = await KufalaaDatabaseHelper().database;
  await performMonthlyReset(db);

  return db;
});
// final kufalaaDbProvider = Provider<KufalaaDatabaseHelper>((ref) {
//   return KufalaaDatabaseHelper();
// });
