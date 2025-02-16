import 'package:intl/intl.dart';

import '../../core.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String balance = '';
  final TranscationViewModel viewModel = TranscationViewModel();
  int offset = 0;
  final int limit = 5;

  @override
  void initState() {
    super.initState();
    fetchTransactions();
    callNominal();
  }

  Future<void> fetchTransactions() async {
    await viewModel.getTransactions(offset, limit);
    if (mounted) {
      setState(() {
        offset += limit;
      });
    }
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
        appBar: appbarMainMenu('Transaksi', () {}),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                containerBalancePayment(balance),
                hbox(45),
                textInter('Transaksi', Colors.black, FontWeight.bold, 16),
                hbox(20),
                Expanded(
                    child: viewModel.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.transactions.length,
                            itemBuilder: (context, i) {
                              final transaction = viewModel.transactions[i];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.6),
                                          width: 1)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          textInter(
                                              '${transaction.transactionType == "PAYMENT" ? '-' : '+'} Rp${(oCcy.format(double.tryParse(transaction.totalAmount.toString())))}',
                                              transaction.transactionType ==
                                                      "PAYMENT"
                                                  ? Colors.red
                                                  : Colors.greenAccent,
                                              FontWeight.w500,
                                              18),
                                          textInter(
                                              transaction.description,
                                              Colors.black,
                                              FontWeight.normal,
                                              12)
                                        ],
                                      ),
                                      textInter(
                                          DateFormat('dd MMM yyyy hh:MM')
                                              .format(transaction.createdOn),
                                          Colors.black54,
                                          FontWeight.normal,
                                          12)
                                    ],
                                  ),
                                ),
                              );
                            })),
                InkWell(
                  onTap: () {
                    viewModel.isLoading ? null : fetchTransactions();
                  },
                  child: Center(
                      child: textInter(
                          'Show More', colorRed(), FontWeight.bold, 14)),
                )
              ],
            ),
          ),
        ));
  }
}
