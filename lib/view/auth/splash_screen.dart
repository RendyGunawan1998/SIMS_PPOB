import '../../core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  checkToken() async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    Future.delayed(Duration(seconds: 2), () {
      if (token != null) {
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsHelper.imgLogo,
              height: 150,
            ),
            hbox(10),
            textInter('SIMS PPOB', Colors.black, FontWeight.bold, 30),
            hbox(25),
            textInter('Rendy Gunawan', Colors.grey.withOpacity(0.7),
                FontWeight.w500, 18)
          ],
        ),
      )),
    );
  }
}
