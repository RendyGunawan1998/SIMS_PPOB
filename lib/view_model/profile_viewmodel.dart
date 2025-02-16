import 'dart:io';

import '../core.dart';

class ProfileViewModel extends ChangeNotifier {
  UserModel? user;
  final ProfileRepository profileRepository = ProfileRepository();

  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchProfile() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 2));
      final ProfileRepository profileRepository = ProfileRepository();
      final SessionManager sessionManager = SessionManager();
      final token = await sessionManager.getToken();
      if (token != null) {
        user = await profileRepository.getProfile(token);
      } else {
        errorMessage = "Token tidak ditemukan";
        Get.snackbar('Alert', errorMessage!);
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      errorMessage = "Terjadi kesalahan: ${e.toString()}";
      Get.snackbar('Alert', errorMessage!);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile(String firstName, String lastName) async {
    isLoading = true;
    notifyListeners();
    try {
      final response =
          await profileRepository.updateProfile(firstName, lastName);
      if (response['message'] == 'Sukses') {
        Get.snackbar('Success', 'Profile success updated');
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        errorMessage =
            response['message'] ?? 'Failed to update profile, please try again';
        print('Error massage update profile :: $errorMessage');
        Get.snackbar('Alert', errorMessage ?? 'Failed to update profile');
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error update profile :: $errorMessage");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfileImage(File image) async {
    print('call upload image');
    isLoading = true;
    notifyListeners();
    try {
      final response = await profileRepository.updateImage(image);
      if (response['message'] == 'Sukses') {
        Get.snackbar('Success', 'Profile image success updated');
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        errorMessage = response['message'] ??
            'Failed to update profile image, please try again';
        print('Error massage update profile :: $errorMessage');
        Get.snackbar('Alert', errorMessage ?? 'Failed to update profile image');
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error update profile image :: $errorMessage");
    }
    isLoading = false;
    notifyListeners();
  }
}
