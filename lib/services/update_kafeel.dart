import 'package:ayn/providers/db_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> updateKafeel({
  required WidgetRef ref,
  required int id,
  required String name,
  required String address,
  required String phone,
  required int monthlyPayment,
}) async {
  final db = await ref.read(kufalaaDbProvider.future);

  return await db.rawUpdate('''
    UPDATE all_kufalaa
    SET 
      kafeel_name = "$name", 
      kafeel_address = "$address", 
      kafeel_phone_number = "$phone", 
      kafeel_monthly_payment = $monthlyPayment

    WHERE id = $id
  ''');
}
