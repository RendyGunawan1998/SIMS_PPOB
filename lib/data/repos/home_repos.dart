import '../../core.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<UserModel?> getProfile(String token) async {
    final response = await _apiService.get(ApiEndpoints.profile, token);
    print('response profile :: $response');
    if (response['message'] == "Sukses") {
      return UserModel.fromJson(response['data']);
    } else {
      return null;
    }
  }

  Future getBalance(String token) async {
    final response = await _apiService.get(ApiEndpoints.balance, token);
    final SessionManager sessionManager = SessionManager();
    print('response balance :: $response');
    if (response['message'] == "Sukses") {
      await sessionManager
          .saveNominal((response['data']['balance']).toString());
      return response['data']['balance'];
    } else {
      return null;
    }
  }
}
