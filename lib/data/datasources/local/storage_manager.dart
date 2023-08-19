import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static final StorageManager instance = StorageManager._internal();

  StorageManager._internal();

  factory StorageManager() {
    return instance;
  }

  late SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}