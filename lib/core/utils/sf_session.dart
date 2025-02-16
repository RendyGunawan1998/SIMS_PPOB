import '../../core.dart';

class SessionManager {
  static const String _tokenKey = "user_token";
  static const String nominal = "nominal";

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveNominal(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(nominal, token);
  }

  Future<String?> getNominal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(nominal);
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
