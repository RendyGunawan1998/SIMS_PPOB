import '../core.dart';

class HomeViewModel extends ChangeNotifier {
  UserModel? user;
  int balance = 0;
  List<String> banners = [];
  List<String> services = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchHomeData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final HomeRepository homeRepository = HomeRepository();
      final SessionManager sessionManager = SessionManager();
      final token = await sessionManager.getToken();
      if (token != null) {
        user = await homeRepository.getProfile(token);
        balance = await homeRepository.getBalance(token);
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
}
