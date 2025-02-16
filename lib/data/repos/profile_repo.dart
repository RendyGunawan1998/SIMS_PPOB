import 'dart:io';

import '../../core.dart';

class ProfileRepository {
  final ApiService apiService = ApiService();

  Future<UserModel?> getProfile(String token) async {
    final response = await apiService.get(ApiEndpoints.profile, token);
    print('response profile :: $response');
    if (response['message'] == "Sukses") {
      return UserModel.fromJson(response['data']);
    } else {
      return null;
    }
  }

  Future updateProfile(String firstName, String lastName) async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    return await apiService.putToken(ApiEndpoints.updateProfile, token!,
        {"first_name": firstName, "last_name": lastName});
  }

  Future updateImage(File image) async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    return await apiService.putImageToken(
        ApiEndpoints.updateProfilePicture, token!, image);
  }
}
