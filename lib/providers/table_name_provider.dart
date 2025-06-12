import 'package:flutter_riverpod/flutter_riverpod.dart';

final tableNameProvider = StateProvider.autoDispose<String>((ref) => 'posts');
