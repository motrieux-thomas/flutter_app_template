import 'package:flutter_test/flutter_test.dart';
import 'package:local_repo/src/errors/errors.dart';
import 'package:local_repo/src/utils/encryption.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  group('getEncryptionKey', () {
    final mockHive = MockHiveInterface();
    final mockSecureStorage = MockFlutterSecureStorage();
    final secureKey = [1, 2, 3];

    tearDown(() {
      reset(mockHive);
      reset(mockSecureStorage);
    });
    test('Create and return key', () async {
      when(() => mockSecureStorage.containsKey(key: 'key'))
          .thenAnswer((_) async => false);
      when(() => mockHive.generateSecureKey()).thenReturn(secureKey);
      when(() =>
              mockSecureStorage.write(key: 'key', value: any(named: "value")))
          .thenAnswer((_) => Future.value());
      when(() => mockSecureStorage.read(key: 'key'))
          .thenAnswer((_) async => "abcdefghijklmnop");

      final key =
          await getEncryptionKey(mockHive, secureStorage: mockSecureStorage);
      expect(key, isNotNull);
    });

    test('Find and return key', () async {
      when(() => mockSecureStorage.containsKey(key: 'key'))
          .thenAnswer((_) async => true);
      when(() => mockSecureStorage.read(key: 'key'))
          .thenAnswer((_) async => "abcdefghijklmnop");

      final key =
          await getEncryptionKey(mockHive, secureStorage: mockSecureStorage);
      expect(key, isNotNull);
    });

    test('Throw when key is null', () async {
      when(() => mockSecureStorage.containsKey(key: 'key'))
          .thenAnswer((_) async => false);
      when(() => mockHive.generateSecureKey()).thenReturn(secureKey);
      when(() =>
              mockSecureStorage.write(key: 'key', value: any(named: "value")))
          .thenAnswer((_) => Future.value());
      when(() => mockSecureStorage.read(key: 'key'))
          .thenAnswer((_) async => null);
      try {
        await getEncryptionKey(mockHive, secureStorage: mockSecureStorage);
      } catch (e) {
        expect(e, equals(noEncriptionKeyException));
      }
    });
  });
}
