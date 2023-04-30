import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox<T> extends Mock implements Box<T> {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {
  mockContainsKeyByDefault() {
    when(() => containsKey(key: 'key')).thenAnswer(
      (_) async => true,
    );
  }

  mockReadBydefault() {
    when(() => read(key: 'key')).thenAnswer(
      (_) async => "d-ZOD_9Fyj1X-pqSq-6y5PV_CRmPDw_r7pxrjHnF-Rk=",
    );
  }
}
