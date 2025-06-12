import 'package:ayn/constants/colors.dart';
import 'package:ayn/providers/app_bar_title_provider.dart';
import 'package:ayn/providers/catigory_id_provider.dart';
import 'package:ayn/providers/db_provider.dart';
import 'package:ayn/providers/post_index_provider.dart';
import 'package:ayn/providers/subcatigory_id_provider.dart';
import 'package:ayn/providers/table_name_provider.dart';
import 'package:ayn/services/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Map<String, dynamic>>? myData;

class PostsTitlesScreen extends ConsumerWidget {
  const PostsTitlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catigory_id = ref.watch(catigoryId);
    final subcatigory_id = ref.watch(subcatigoryId);
    final tableName = ref.watch(tableNameProvider);
    String selectionQuery() {
      return '''
            SELECT * FROM $tableName
WHERE $tableName.catigory_id = $catigory_id 
AND $tableName.subcatigory_id = $subcatigory_id;
            ''';
    }

    final postData = ref.watch(dbProvider);
    final appBartitle = ref.watch(appBatTitleProvider);
    return Scaffold(
      appBar: AppBar(title: Text(appBartitle), centerTitle: true),

      body: postData.when(
        data: (data) {
          return FutureBuilder(
            future: data.rawQuery(selectionQuery()),
            builder: (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Text('Error');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: primary));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                // Here I made new List from the originall data then I modifies the copied list to be in random order
                if (myData == null || myData!.length != snapshot.data!.length) {
                  myData = List.from(
                    snapshot.data!,
                  ); // Create a copy of the data
                }

                final dividedTiles = ListTile.divideTiles(
                  context: context,
                  tiles: myData!.map(
                    (item) => ListTile(
                      title: Text(
                        item["title"],
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        int index = myData!.indexOf(item);
                        ref.read(postIndexProvider.notifier).state = index;
                        if (tableName == "posts") {
                          Navigator.pushNamed(context, "postContent");
                        } else if (tableName == "pos_tutorials") {
                          launchMyUrl(item["link"]);
                        }
                      },
                    ),
                  ),
                  color: Colors.grey[300],
                ).toList();

                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    itemCount: dividedTiles.length,
                    itemBuilder: (context, index) {
                      return dividedTiles[index];
                    },
                  ),
                );
              }
              return const Text('NOT Working');
            },
          );
        },
        error: (error, stacktace) {
          return Center(child: Text(Exception(error).toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator(color: primary));
        },
      ),
    );
  }
}
