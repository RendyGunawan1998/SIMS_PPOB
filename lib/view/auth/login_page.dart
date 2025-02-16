import '../../core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool press = false;

  @override
  void initState() {
    super.initState();
    emailController.text = 'user@nutech-integrasi.com';
    passwordController.text = 'abcdef1234';
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hbox(Get.height * 0.2),
                  rowLogo(),
                  hbox(20),
                  textInterAlignCenter('Masuk atau buat akun untuk memulai',
                      Colors.black, FontWeight.bold, 28),
                  hbox(50),
                  tfEmail('Email', emailController, press),
                  hbox(20),
                  tfPass('Password', passwordController, obscureText, press,
                      () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }),
                  hbox(40),
                  containerRedButton('Masuk', () async {
                    setState(() {
                      press = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      await authViewModel.login(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  }),
                  hbox(25),
                  rowDaftarDisini()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
