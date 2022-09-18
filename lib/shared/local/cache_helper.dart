import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreference;

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool> putDataInSharedPreference({
    required dynamic value,
    required String key,
  }) async {
    if(value is String) {
      return await sharedPreference.setString(key, value);
    }
    if(value is int) {
      return await sharedPreference.setInt(key, value);
    }
    if(value is bool) {
      return await sharedPreference.setBool(key, value);
    } else {
      return await sharedPreference.setDouble(key, value);
    }
  }


  static dynamic getDataFromSharedPreference({
    required String key,
  }) {
    return sharedPreference.get(key);
  }

  static Future<bool> clearDataFromSharedPreference({
    required String key,
  }) async{
    return await sharedPreference.remove(key);
  }
}