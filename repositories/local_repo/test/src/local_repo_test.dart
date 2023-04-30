import 'package:flutter_test/flutter_test.dart';
import 'package:local_repo/local_repo.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mocks.dart';

void main() {
  test('local repo can init', () async {
    final mockHive = MockHiveInterface();
    final mockSecureStorage = MockFlutterSecureStorage();

    mockSecureStorage.mockContainsKeyByDefault();
    mockSecureStorage.mockReadBydefault();

    when(
      () => mockHive.openBox<String>(
        any(),
        encryptionCipher: any(named: "encryptionCipher"),
      ),
    ).thenAnswer((_) => Future.value(MockHiveBox<String>()));

    final localRepo = await initLocalRepo(
      mockHive,
      secureStorage: mockSecureStorage,
    );

    expect(localRepo, isNotNull);
  });
}
