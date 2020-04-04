import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class GlobalKeysModel extends Model {
  Map<String, GlobalKey> _globalKeys = Map<String, GlobalKey>();

  Map<String, GlobalKey> get globalKeys => _globalKeys;

  void addKey(String keyId, GlobalKey keyValue) {
    _globalKeys[keyId] = keyValue;
    notifyListeners();
  }

  void cleanKeys() {
    _globalKeys.clear();
    notifyListeners();
  }
}
