
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web_provise/core/constants/constant_key.dart';

class LocalStorageHelper {
  LocalStorageHelper._internal();
  static final LocalStorageHelper _shared = LocalStorageHelper._internal();

  factory LocalStorageHelper() {
    return _shared;
  }

  Box<dynamic>? hiveBox;
  Box<dynamic>? encryptedHiveBox;

  static initStorage() async {
    _shared.hiveBox = await Hive.openBox(HiveKeys.boxName);
  }

  static dynamic getValue(String key) {
    return _shared.hiveBox?.get(key);
  }

  static bool checkDataExist(String key) {
    return _shared.hiveBox?.get(key) != null;
  }

  static setValue(String key, dynamic val) {
    _shared.hiveBox?.put(key, val);
  }

  static deleteValue(String key) {
    _shared.hiveBox?.delete(key);
  }
}
