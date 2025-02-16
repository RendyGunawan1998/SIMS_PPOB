import '../../core.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool reobscureText = true;
  bool press = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hbox(Get.height * 0.05),
                  rowLogo(),
                  hbox(20),
                  textInterAlignCenter('Lengkapi data untuk membuat akun',
                      Colors.black, FontWeight.bold, 28),
                  hbox(50),
                  tfEmail('Email@nutech-integrasi.com', emailController, press),
                  hbox(20),
                  tf('First Name', Icons.person_outline_rounded,
                      firstController, press),
                  hbox(20),
                  tf('Last Name', Icons.person_outline_rounded, lastController,
                      press),
                  hbox(20),
                  tfPass('Password', passwordController, obscureText, press,
                      () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }),
                  hbox(20),
                  tfRePass('Konfirmasi Password', passwordController,
                      repasswordController, reobscureText, press, () {
                    setState(() {
                      reobscureText = !reobscureText;
                    });
                  }),
                  hbox(40),
                  containerRedButton('Registrasi', () async {
                    setState(() {
                      press = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      await authViewModel.registrasi(
                        firstController.text,
                        lastController.text,
                        emailController.text,
                        passwordController.text,
                      );
                      if (authViewModel.errorMessage == null) {
                        Get.offNamed(AppRoutes.home);
                      }
                    }
                  }),
                  hbox(20),
                  rowSudahPunyaAkun(),
                  hbox(35),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
