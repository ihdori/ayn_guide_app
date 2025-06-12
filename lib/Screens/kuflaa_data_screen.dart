import 'package:ayn/providers/all_kuflaa_provider.dart';
import 'package:ayn/providers/kufalaa_providers/contacted_kufalaa_provider.dart';
import 'package:ayn/providers/kufalaa_providers/has_debt_kufalaa_provider.dart';
import 'package:ayn/providers/kufalaa_providers/remaining_kufalaa_provider.dart';
import 'package:ayn/utils/kuflaa_tabs/all_kufalaa_tab.dart';
import 'package:ayn/utils/kuflaa_tabs/contacted_kufalaa.dart';
import 'package:ayn/utils/kuflaa_tabs/kufalaa_with_debt_tab.dart';
import 'package:ayn/utils/kuflaa_tabs/remaining_kufalaa_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KuflaaDataScreen extends ConsumerWidget {
  const KuflaaDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kufalaaData = ref.watch(allKufalaaProvider);
    final contactedKufalaa = ref.watch(contactedKufalaaProvider);
    final remainigKufalaa = ref.watch(remainingKufalaaProvider);
    final kufalaaWithDebt = ref.watch(KufalaaWithDebtProvider);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: const Text('الكفلاء'), centerTitle: true),
        body: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,

              child: TabBar(
                tabs: [
                  Tab(text: 'الكل'),
                  Tab(text: 'المديونون'),
                  Tab(text: 'تم التواصل'),
                  Tab(text: 'المتبقون'),
                ],
              ),
            ),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,

                child: TabBarView(
                  children: [
                    //all Kufalaa
                    kufalaaData.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text("لا توجد بيانات حالياً"),
                          );
                        }

                        return AllKufalaaTab(data: data);
                      },
                      error: (error, _) =>
                          Center(child: Text("حدث خطأ: $error")),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    //Has Debts
                    kufalaaWithDebt.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text("لا توجد بيانات حالياً"),
                          );
                        }

                        return KufalaaWithDebtTab(data: data);
                      },
                      error: (error, _) =>
                          Center(child: Text("حدث خطأ: $error")),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    //Contact Done
                    contactedKufalaa.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text("لا توجد بيانات حالياً"),
                          );
                        }

                        return ContactedKufalaa(data: data);
                      },
                      error: (error, _) =>
                          Center(child: Text("حدث خطأ: $error")),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    //Remainings
                    remainigKufalaa.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text("لا توجد بيانات حالياً"),
                          );
                        }

                        return RemainingKufalaaTab(data: data);
                      },
                      error: (error, _) =>
                          Center(child: Text("حدث خطأ: $error")),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
