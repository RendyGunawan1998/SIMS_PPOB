import '../core.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final SessionManager _sessionManager = SessionManager();
  bool isLoading = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _authRepository.login(email, password);
      if (response['message'] == 'Login Sukses') {
        // print('token :: ${response['data']['token']}');
        await _sessionManager.saveToken(response['data']['token']);
        Get.snackbar('Success', 'Success login');
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        errorMessage =
            response['message'] ?? 'Failed to login, please try again';
        print('Error massage Login :: $errorMessage');
        Get.snackbar('Alert', errorMessage ?? 'Failed to login');
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error Login :: $errorMessage");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> registrasi(
      String first, String last, String email, String password) async {
    isLoading = true;
    notifyListeners();
    print(
        'first :: $first, last :: $last, Email :: $email, Password :: $password');
    try {
      final response =
          await _authRepository.register(first, last, email, password);
      if (response['message'] == 'Registrasi berhasil silahkan login') {
        Get.snackbar('Success', 'Registration success');
        Get.offAllNamed(AppRoutes.login);
      } else {
        errorMessage =
            response['message'] ?? 'Failed to registration, please try again';
        print('Error massage registration :: $errorMessage');
        Get.snackbar('Alert', errorMessage!);
      }
    } catch (e) {
      errorMessage = e.toString();
      Get.snackbar('Error', errorMessage!);
      print("Catch error registration :: $errorMessage");
    }

    isLoading = false;
    notifyListeners();
  }
}
