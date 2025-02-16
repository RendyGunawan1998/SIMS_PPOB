import '../core.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String topup = '/topup';
  static const String payment = '/payment';
  static const String profile = '/profile';
  static const String history = '/history';
  static const String navbar = '/navbar';

  static final pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => RegistrationPage()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: topup, page: () => TopUpScreen()),
    GetPage(name: payment, page: () => PaymentScreen()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: history, page: () => HistoryScreen()),
    GetPage(name: navbar, page: () => BottomNavScreen()),
  ];
}
