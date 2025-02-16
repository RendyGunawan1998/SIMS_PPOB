import '../core.dart';

class TranscationViewModel extends ChangeNotifier {
  final TranscationRepos transcationRepos = TranscationRepos();
  Service? selectedService;
  List<Service> service = [];
  List<Transaction> transactions = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> topUp(String nominal) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await transcationRepos.topUp(nominal);
      if (response['message'] == 'Top Up Balance berhasil') {
        Get.snackbar('Success', 'Top Up Success');
        Get.toNamed(AppRoutes.payment);
      } else {
        errorMessage =
            response['message'] ?? 'Failed to Top Up, please try again';
        print('Error massage topup :: $errorMessage');
        Get.snackbar('Alert', errorMessage ?? 'Failed to login');
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error topup :: $errorMessage");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> listPembayran() async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await transcationRepos.listPembayran();
      if (result != null) {
        service = result;
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error service :: $errorMessage");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTransactions(int offset, int limit) async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await transcationRepos.fetchTransactions(offset, limit);
      if (result != null) {
        transactions = result;
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error transaction :: $errorMessage");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> pay(BuildContext context, Service service, String code) async {
    isLoading = true;
    notifyListeners();
    try {
      print('code :: $code');
      final response = await transcationRepos.transactionPay(code);
      print('response :: $response');
      if (response['message'] == 'Transaksi berhasil') {
        Get.snackbar('Success', 'Transaksi Payment Success');
        // ignore: use_build_context_synchronously
        showDialogSuccess(context, 'Pembayaran ${service.serviceName} sebesar',
            'Rp${(oCcy.format(double.tryParse(service.serviceTariff.toString()))).toString()}',
            () {
          Navigator.pop(context);
        });
        Get.offAllNamed(AppRoutes.navbar);
      } else {
        errorMessage =
            response['message'] ?? 'Failed to Payment, please try again';
        print('Error massage payment :: $errorMessage');
        Get.snackbar('Alert', errorMessage ?? 'Failed to login');
      }
    } catch (e) {
      errorMessage = e.toString();
      print("Catch error pay :: $errorMessage");
    }
    isLoading = false;
    notifyListeners();
  }
}
