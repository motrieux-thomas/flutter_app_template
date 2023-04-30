import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/domains/cheat_code/logic/cheat_code_notifier.dart';

// We don't care about testing cheat code...
// coverage:ignore-file

final cheatCodeNotifierProvider = ChangeNotifierProvider<CheatCodeNotifier>(
  (ref) => CheatCodeNotifier(),
);
