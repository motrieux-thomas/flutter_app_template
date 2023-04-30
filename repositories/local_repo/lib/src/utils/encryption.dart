import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:local_repo/src/errors/errors.dart';

Future<Uint8List> getEncryptionKey(
  HiveInterface hive, {
  required FlutterSecureStorage secureStorage,
}) async {
  // @TODO: use `secureStorage.containsKey` when this issue is fixed:
  // https://github.com/mogol/flutter_secure_storage/issues/338
  final maybeNullCodedKey = await secureStorage.read(key: 'key');

  if (maybeNullCodedKey == null || maybeNullCodedKey.isEmpty) {
    final key = hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64UrlEncode(key));
  } else {
    return base64Url.decode(maybeNullCodedKey);
  }

  final codedKey = await secureStorage.read(key: 'key');
  if (codedKey == null) {
    throw noEncriptionKeyException;
  }

  // we can not mock read with two different response in the same call.
  // coverage:ignore-start
  final encryptionKey = base64Url.decode(codedKey);

  return encryptionKey;
  // coverage:ignore-end
}
