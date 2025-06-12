import 'package:ayn/constants/colors.dart';
import 'package:ayn/providers/db_provider.dart';
import 'package:ayn/providers/post_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String selectionQuery() {
  return '''
            SELECT * FROM posts
WHERE posts.catigory_id = 1 
AND posts.subcatigory_id = 1;
            ''';
}

List<Map<String, dynamic>>? myData;

class PostContentScreen extends ConsumerWidget {
  const PostContentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(dbProvider);
    final indexProvider = ref.watch(postIndexProvider);
    return Scaffold(
      appBar: AppBar(title: Text("اجراءات الصناديق"), centerTitle: true),

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

                return Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    myData![indexProvider]["content"],
                    textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16),
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
