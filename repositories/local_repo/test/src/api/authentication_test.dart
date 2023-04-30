import 'package:flutter_test/flutter_test.dart';
import 'package:local_repo/local_repo.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  group('LocalAuthenticationApi', () {
    late MockHiveInterface mockHive;
    late MockFlutterSecureStorage mockSecureStorage;
    late MockHiveBox<String> box;

    setUp(() {
      mockHive = MockHiveInterface();
      mockSecureStorage = MockFlutterSecureStorage();
      box = MockHiveBox<String>();

      when(() => mockSecureStorage.containsKey(key: 'key')).thenAnswer(
        (_) async => true,
      );

      when(() => mockSecureStorage.read(key: 'key')).thenAnswer(
        (_) async => "d-ZOD_9Fyj1X-pqSq-6y5PV_CRmPDw_r7pxrjHnF-Rk=",
      );

      when(
        () => mockHive.openBox<String>(
          any(),
          encryptionCipher: any(named: "encryptionCipher"),
        ),
      ).thenAnswer((_) => Future.value(box));
    });

    test('Could be instanciated', () async {
      final localApi = await LocalAuthenticationApi.getApi(
        hive: mockHive,
        secureStorage: mockSecureStorage,
      );

      expect(localApi, isNotNull);
    });

    test('Should manipulate raw token', () async {
      String? rawToken = 'oldToken';

      when(() => box.get(any())).thenReturn(rawToken);

      when(() => box.put(any(), 'newToken')).thenAnswer((_) {
        rawToken = 'newToken';
        return Future.value();
      });

      when(() => box.delete(any())).thenAnswer((_) {
        rawToken = null;
        return Future.value();
      });

      final localApi = await LocalAuthenticationApi.getApi(
        hive: mockHive,
        secureStorage: mockSecureStorage,
      );

      final token = localApi.getRawToken();
      expect(token, 'oldToken');

      await localApi.putRawToken('newToken');
      expect(rawToken, 'newToken');

      await localApi.deleteRawToken();
      expect(rawToken, isNull);
    });

    test('Should manipulate email', () async {
      String? email = 'oldEmail';

      when(() => box.get(any())).thenReturn(email);

      when(() => box.put(any(), 'newEmail')).thenAnswer((_) {
        email = 'newEmail';
        return Future.value();
      });

      when(() => box.delete(any())).thenAnswer((_) {
        email = null;
        return Future.value();
      });

      final localApi = await LocalAuthenticationApi.getApi(
        hive: mockHive,
        secureStorage: mockSecureStorage,
      );

      expect(localApi.getEmail(), 'oldEmail');

      await localApi.putEmail('newEmail');
      expect(email, 'newEmail');

      await localApi.deleteEmail();
      expect(email, isNull);
    });
  });
}
