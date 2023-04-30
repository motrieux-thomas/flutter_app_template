import 'package:flutter_test/flutter_test.dart';
import 'package:local_repo/local_repo.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  group('PreferencesApi', () {
    final MockHiveInterface mockHive = MockHiveInterface();
    final mockStringBox = MockHiveBox<String>();

    setUp(() {
      when(
        () => mockHive.openBox<String>(any()),
      ).thenAnswer((_) => Future.value(mockStringBox));
    });

    tearDown(() {
      reset(mockHive);
      reset(mockStringBox);
    });

    test('Could be instanciated', () async {
      final preferencesApi = await PreferencesApi.getApi(hive: mockHive);
      expect(preferencesApi, isNotNull);
    });

    test('Should get an active theme', () async {
      when(() => mockStringBox.get(any())).thenReturn("light");

      final preferencesApi = await PreferencesApi.getApi(hive: mockHive);
      final activeTheme = preferencesApi.getActiveTheme();

      expect(activeTheme, equals("light"));
    });

    test(
      'Could save an active theme',
      () async {
        when(() => mockStringBox.get(any())).thenReturn('light');
        when(() => mockStringBox.put(any(), any())).thenAnswer((_) async {
          return;
        });

        const query = 'dark';
        final preferencesApi = await PreferencesApi.getApi(hive: mockHive);
        await preferencesApi.putActiveTheme(query);

        verify(() => mockStringBox.put(any(), 'dark')).called(1);
      },
    );
  });
}
