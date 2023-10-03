import 'package:shared_preferences/shared_preferences.dart';

class CachedData {
  static String NAME = 'NAME';
  static String IMAGE = 'IMAGE';
  Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(NAME, name);
  }

  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString(NAME));
    return prefs.getString(NAME)!;
  }

  getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(IMAGE);
  }
}
