import 'package:ayn/constants/colors.dart';
import 'package:ayn/data/kuflaa_db.dart';
import 'package:ayn/providers/db_provider.dart';
import 'package:ayn/providers/kufalaa_providers/isCatigoryTableCreatedProvider.dart';
import 'package:ayn/utils/custom_large_button.dart';
import 'package:ayn/utils/custom_text_field.dart';
import 'package:ayn/utils/kuflaa_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class kufalaaScreen extends ConsumerWidget {
  kufalaaScreen({super.key});
  KufalaaDatabaseHelper kufalaaDb = KufalaaDatabaseHelper();
  GlobalKey<FormState> _kufalaaKey = GlobalKey<FormState>();

  //TextField Controlers
  final _nameControler = TextEditingController();
  final _phoneNumberControler = TextEditingController();
  final _adressControler = TextEditingController();
  final _kafalaCostControler = TextEditingController();
  final now = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.sizeOf(context).width),
            Container(
              width: MediaQuery.sizeOf(context).width - 10,
              height: MediaQuery.sizeOf(context).height * 0.275,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 242, 226),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'كفلاء اليوم',
                        style: TextStyle(fontSize: 22),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  SizedBox(height: 120),
                  TextButton(
                    onPressed: () {},
                    child: Text('عرض الكل', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KuflaaNumbers(text: "تم التواصل", number: 22),
                KuflaaNumbers(text: "المتبقون", number: 16, color: secondary),
              ],
            ),
            CustomLargeButton(
              onTap: () {
                Navigator.pushNamed(context, 'kuflaa');
              },
              text: "عرض كل الكفلاء",
            ),
            CustomLargeButton(
              onTap: () async {
                final isCatitgoryTableCreated = ref.watch(
                  isCatigoryTableCreatedProvider,
                );
                if (!isCatitgoryTableCreated) {
                  await kufalaaDb.insert('''
  INSERT INTO kafeel_catigory (catigory_name)
VALUES 
  ("في الانتظار"),
  ("تم التواصل");
    ''');
                  ref.read(isCatigoryTableCreatedProvider.notifier).state =
                      true;
                }
                showNewKafeelBottomSheet(context);
              },
              text: "اضافة كفيل",
              color: secondary,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showNewKafeelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                height: MediaQuery.sizeOf(context).height * 0.64,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    key: _kufalaaKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _adressControler.clear();
                                _kafalaCostControler.clear();
                                _nameControler.clear();
                                _phoneNumberControler.clear();
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close, size: 32),
                            ),
                          ],
                        ),
                        CustomTextField(
                          validator: (value) {},
                          controller: _nameControler,
                          lable: "اسم الكفيل",
                          hint: "محمد جواد علي",
                        ),
                        CustomTextField(
                          validator: () {},
                          textInputType: TextInputType.phone,
                          controller: _phoneNumberControler,
                          lable: "رقم هاتف الكفيل",
                          hint: "07806233291",
                        ),
                        CustomTextField(
                          validator: () {},
                          controller: _adressControler,
                          lable: "عنوان الكفيل",
                          hint: "الناصرية/شارع الشيباني/قرب عصير تايم",
                        ),
                        CustomTextField(
                          validator: () {},

                          textInputType: TextInputType.number,
                          controller: _kafalaCostControler,
                          lable: "مبلغ الكفالة",
                          hint: "95,000",
                        ),
                        CustomLargeButton(
                          text: 'إضافة الكفيل',
                          onTap: () async {
                            if (_kufalaaKey.currentState!.validate()) {
                              final now = DateTime.now().toIso8601String();
                              final rawAmount = _kafalaCostControler.text
                                  .trim();
                              final amount =
                                  int.tryParse(
                                    rawAmount
                                        .replaceAll('٠', '0')
                                        .replaceAll('١', '1')
                                        .replaceAll('٢', '2')
                                        .replaceAll('٣', '3')
                                        .replaceAll('٤', '4')
                                        .replaceAll('٥', '5')
                                        .replaceAll('٦', '6')
                                        .replaceAll('٧', '7')
                                        .replaceAll('٨', '8')
                                        .replaceAll('٩', '9')
                                        .replaceAll(RegExp(r'[^\d]'), ''),
                                  ) ??
                                  0;
                              await kufalaaDb.insert('''
                      INSERT INTO all_kufalaa (
                        kafeel_name,
                        kafeel_address,
                        kafeel_phone_number,
                        kafeel_monthly_payment,
                        created_at
                      ) VALUES (
                        "${_nameControler.text}",
                        "${_adressControler.text}",
                        "${_phoneNumberControler.text}",
                        $amount,
                        "$now"
                      )
                    ''');

                              ref.refresh(kufalaaDbProvider);
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
