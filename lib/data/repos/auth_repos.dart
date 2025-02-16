import '../../core.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _apiService
        .post(ApiEndpoints.login, {"email": email, "password": password});
  }

  Future<Map<String, dynamic>> register(
      String first, String last, String email, String password) async {
    return await _apiService.post(ApiEndpoints.register, {
      "first_name": first,
      "last_name": last,
      "email": email,
      "password": password,
    });
  }
}
