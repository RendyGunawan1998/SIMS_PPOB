import 'dart:io';
import '../../core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController first = TextEditingController();
  final TextEditingController last = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CameraService cameraService = CameraService();
  bool edit = false;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false).fetchProfile();
    });
  }

  Future<void> getImageFromCamera() async {
    final image = await cameraService.pickImageFile();
    if (image != null) {
      setState(() {
        imageFile = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    first.text = profileViewModel.user?.firstName ?? '';
    last.text = profileViewModel.user?.lastName ?? '';
    emailController.text = profileViewModel.user?.email ?? '';

    return Scaffold(
        appBar: appbarMainMenu('Akun', () {}),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  profileEdit(
                      profileViewModel.user?.profileImage ??
                          AssetsHelper.imgPPBig,
                      imageFile, () {
                    getImageFromCamera();
                  }),
                  hbox(15),
                  textInter('${first.text} ${last.text}', Colors.black87,
                      FontWeight.bold, 22),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textInter(
                              'Email', Colors.black, FontWeight.normal, 14),
                          hbox(8),
                          tfEmailProfile('Email', emailController, edit),
                          hbox(20),
                          textInter('Nama Depan', Colors.black,
                              FontWeight.normal, 14),
                          hbox(8),
                          tfProfile('Nama Depan', Icons.person_outline_rounded,
                              first, edit),
                          hbox(20),
                          textInter(' Nama Belakang', Colors.black,
                              FontWeight.normal, 14),
                          hbox(8),
                          tfProfile('Nama Belakang',
                              Icons.person_outline_rounded, last, edit),
                          hbox(20),
                        ],
                      ),
                    ],
                  ),
                  imageFile == null && edit == false
                      ? containerRedButton('Edit Profile', () {
                          setState(() {
                            edit = true;
                          });
                        })
                      : containerRedButton('Simpan', () async {
                          edit == true
                              ? await profileViewModel.updateProfile(
                                  first.text, last.text)
                              : await profileViewModel
                                  .updateProfileImage(imageFile!);
                        }),
                  hbox(20),
                  edit == false && imageFile == null
                      ? containerBorderRedButton('Logout', () async {
                          await SessionManager().clearSession();
                          Get.offAllNamed(AppRoutes.login);
                        })
                      : containerBorderRedButton('Batalkan', () {
                          setState(() {
                            edit = false;
                          });
                        })
                ],
              ),
            ),
          ),
        ));
  }
}
