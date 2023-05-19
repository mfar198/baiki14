import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  late SharedPreferences _preferences;

  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String get accessToken => _preferences.getString('access_token') ?? '';

  set accessToken(String value) {
    _preferences.setString('access_token', value);
  }

  bool get isLoggedIn => accessToken.isNotEmpty;
}
