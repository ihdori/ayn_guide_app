import 'package:sqflite/sqflite.dart';

Future<void> performMonthlyReset(Database db) async {
  final today = DateTime.now();
  if (today.day != 18) return;

  final batch = db.batch();

  // Get remaining kufalaa
  final remaining = await db.rawQuery('SELECT * FROM remaining_kufalaa');

  for (final row in remaining) {
    final kafeelId = row['kafeel_id'];

    // Check if already in debt table
    final existingDebt = await db.rawQuery(
      'SELECT * FROM kufalaa_with_debt WHERE kafeel_id = ?',
      [kafeelId],
    );

    if (existingDebt.isNotEmpty) {
      // Update total debt (you decide how much to add)
      final currentDebt = existingDebt.first['total_debt'] as int;
      final updatedDebt = currentDebt + 190000;

      await db.rawUpdate(
        'UPDATE kufalaa_with_debt SET total_debt = ?, last_update = ? WHERE kafeel_id = ?',
        [updatedDebt, today.toIso8601String(), kafeelId],
      );
    } else {
      await db.rawInsert(
        'INSERT INTO kufalaa_with_debt (kafeel_id, total_debt, last_update) VALUES (?, ?, ?)',
        [kafeelId, 190000, today.toIso8601String()],
      );
    }
  }

  // Clear and regenerate remaining_kufalaa
  await db.delete('remaining_kufalaa');

  final allKufalaa = await db.rawQuery('SELECT id FROM all_kufalaa');
  for (final row in allKufalaa) {
    await db.insert('remaining_kufalaa', {
      'kafeel_id': row['id'],
      'added_date': today.toIso8601String(),
    });
  }
}
