import 'package:ayn/providers/all_kuflaa_provider.dart';
import 'package:ayn/services/update_kafeel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void kafeelDetailsDialog(
  BuildContext context,
  WidgetRef ref,
  Map<String, dynamic> kafeel,
) {
  final nameController = TextEditingController(text: kafeel['kafeel_name']);
  final phoneController = TextEditingController(
    text: kafeel['kafeel_phone_number'],
  );
  final addressController = TextEditingController(
    text: kafeel['kafeel_address'],
  );
  final costController = TextEditingController(
    text: kafeel['kafeel_monthly_payment'].toString(),
  );

  showDialog(
    context: context,
    builder: (_) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text("معلومات الكفيل"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "الاسم"),
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "رقم الهاتف"),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: "العنوان"),
              ),
              TextFormField(
                controller: costController,
                decoration: const InputDecoration(labelText: "المبلغ الشهري"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              final result = await updateKafeel(
                ref: ref,
                id: kafeel['id'],
                name: nameController.text,
                address: addressController.text,
                phone: phoneController.text,
                monthlyPayment: int.parse(costController.text),
              );

              if (result > 0) {
                ref.invalidate(allKufalaaProvider); // 🔁 Refresh data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم تحديث الكفيل بنجاح')),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('لم يتم التحديث')));
              }

              Navigator.pop(context);
            },
            child: const Text("حفظ التغييرات"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("إغلاق"),
          ),
        ],
      ),
    ),
  );
}
