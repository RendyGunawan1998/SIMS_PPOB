import '../../core.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final TextEditingController nominal = TextEditingController();
  bool chooseNominal = true;
  String balance = '';

  @override
  void initState() {
    super.initState();
    callNominal();
  }

  callNominal() async {
    final SessionManager sessionManager = SessionManager();
    var saldo = await sessionManager.getNominal() ?? '';
    setState(() {
      balance = (oCcy.format(double.tryParse(saldo)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarMainMenu('Top Up', () {}),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hbox(15),
                  containerBalancePayment(balance),
                  hbox(45),
                  textInter(
                      'Silahkan masukkan', Colors.black, FontWeight.normal, 14),
                  textInter(
                      'nominal Top Up', Colors.black, FontWeight.w500, 16),
                  hbox(50),
                  chooseNominal == false
                      ? tfProfile(
                          'masukkan nominal Top Up', Icons.abc, nominal, false)
                      : hbox(0),
                  hbox(15),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          childAspectRatio: 12 / 4,
                          mainAxisSpacing: 10),
                      itemCount: itemsNominal.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              chooseNominal = false;
                              nominal.text = itemsNominal[i]['nilai'];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.75),
                                    width: 1),
                                color: Colors.white),
                            child: Center(
                              child: textInter(itemsNominal[i]['nominal'],
                                  Colors.black87, FontWeight.normal, 14),
                            ),
                          ),
                        );
                      }),
                  hbox(40),
                  containerGreyButton('Top Up', chooseNominal, nominal, () {
                    if (nominal.text.isEmpty) {
                      Get.snackbar('Nominal not choosen',
                          'Nominal belum dipilih, silahkan pilih atau masukkan nominal terlebih dahulu');
                    } else {
                      showDialogTopUp(context, 'Top Up',
                          'Anda yakin untuk Top Up sebesar', nominal.text, () {
                        final transactionViewModel =
                            Provider.of<TranscationViewModel>(context,
                                listen: false);
                        transactionViewModel.topUp(nominal.text);
                      }, () {
                        Navigator.pop(context);
                      });
                    }
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
