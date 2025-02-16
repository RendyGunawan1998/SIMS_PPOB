import '../../core.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String balance = '';
  Service? service;
  @override
  void initState() {
    super.initState();
    callNominal();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TranscationViewModel>(context, listen: false).listPembayran();
    });
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
        appBar: appbarMainMenu('Pembayaran', () {
          Get.back();
        }),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                hbox(15),
                containerBalancePayment(balance),
                hbox(25),
                Consumer<TranscationViewModel>(
                    builder: (context, transactionViewModel, i) {
                  if (transactionViewModel.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (transactionViewModel.errorMessage != null) {
                    return Center(
                        child: Text(transactionViewModel.errorMessage!));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textInter(
                          'Pembayaran', Colors.black87, FontWeight.normal, 14),
                      service != null ? hbox(8) : hbox(0),
                      service != null
                          ? Row(
                              children: [
                                Image.network(
                                  service!.serviceIcon,
                                  height: 25,
                                ),
                                wbox(8),
                                textInter(service!.serviceName, Colors.black,
                                    FontWeight.bold, 14)
                              ],
                            )
                          : hbox(0),
                      hbox(15),
                      transactionViewModel.service.isEmpty
                          ? hbox(0)
                          : Container(
                              width: Get.width,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.6),
                                      width: 1),
                                  color: Colors.white),
                              child: DropdownButton<Service>(
                                value: transactionViewModel.selectedService,
                                isExpanded: true,
                                items:
                                    transactionViewModel.service.map((service) {
                                  return DropdownMenuItem<Service>(
                                    value: service,
                                    child: Row(
                                      children: [
                                        Icon(Icons.view_comfortable_outlined),
                                        wbox(8),
                                        Text((oCcy.format(double.tryParse(
                                                service.serviceTariff
                                                    .toString())))
                                            .toString()),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    print('newValue :: $newValue');
                                    service = newValue;
                                    transactionViewModel.selectedService =
                                        newValue;
                                  });
                                },
                              ),
                            ),
                      hbox(Get.height * 0.25),
                      containerRedButton('Bayar', () {
                        showDialogTopUp(
                            context,
                            'Bayar',
                            'Bayar ${service!.serviceName} senilai',
                            'Rp${(oCcy.format(double.tryParse(service!.serviceTariff.toString()))).toString()}',
                            () {
                          Navigator.pop(context);
                          final transactionViewModel =
                              Provider.of<TranscationViewModel>(context,
                                  listen: false);
                          transactionViewModel.selectedService = null;
                          transactionViewModel.pay(
                              context, service!, service!.serviceCode);
                        }, () {
                          Navigator.pop(context);
                        });
                      }),
                    ],
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
