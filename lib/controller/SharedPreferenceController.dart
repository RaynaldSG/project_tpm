import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceController {
  static late SharedPreferences sharedPrefData;

  static Future init() async {
    sharedPrefData = await SharedPreferences.getInstance();
  }
}