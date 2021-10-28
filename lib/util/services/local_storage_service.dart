/*import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../user.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService();
  static late SharedPreferences _preferences;
  static const String userKey = 'user';


  static Future<LocalStorageService> getInstance() async {

    _preferences = await SharedPreferences.getInstance();

    return _instance;
  }

  Users get user {
    var userJson = _getFromDisk(userKey);

    return Users.fromJson(json.decode(userJson));
  }

  set user(Users userToSave) {
    _saveToDisk(userKey, json.encode(userToSave.toJson()));
  }

  dynamic _getFromDisk(String key) {
    var value  = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T content){
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if(content is String) {
      _preferences.setString(key, content);
    }
    if(content is bool) {
      _preferences.setBool(key, content);
    }
    if(content is int) {
      _preferences.setInt(key, content);
    }
    if(content is double) {
      _preferences.setDouble(key, content);
    }
    if(content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}

 */