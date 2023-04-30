// ignore_for_file: depend_on_referenced_packages

import 'package:file/file.dart' as f;
import 'package:file/local.dart' as l;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform/platform.dart' as p;

Future<void> loadFonts() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await _loadFamily(
    'template_theme',
    'Roboto_regular',
    [
      'assets/google_fonts/Roboto-Regular.ttf',
    ],
  );

  await _loadMaterialIconFont();
}

// Loads the cached material icon font.
// Only necessary for golden tests. Relies on the tool updating cached assets
// before running tests.
Future<void> _loadMaterialIconFont() async {
  const f.FileSystem fs = l.LocalFileSystem();
  const p.Platform platform = p.LocalPlatform();
  final flutterRoot = fs.directory(platform.environment['FLUTTER_ROOT']);

  final iconFont = flutterRoot.childFile(
    fs.path.join(
      'bin',
      'cache',
      'artifacts',
      'material_fonts',
      'MaterialIcons-Regular.otf',
    ),
  );

  final bytes = Future<ByteData>.value(
    iconFont.readAsBytesSync().buffer.asByteData(),
  );

  await (FontLoader('MaterialIcons')..addFont(bytes)).load();
}

Future<void> _loadFamily(
  String package,
  String name,
  List<String> assets,
) async {
  final prefix = 'packages/$package/';
  final fontLoader = FontLoader('$prefix$name');

  for (final asset in assets) {
    final bytes = rootBundle.load('$prefix$asset');
    fontLoader.addFont(bytes);
  }
  await fontLoader.load();
}
