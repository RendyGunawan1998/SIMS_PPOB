// ignore_for_file: unnecessary_type_check

import '../../core.dart';

class TranscationRepos {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> topUp(String nominal) async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    return await _apiService
        .postToken(ApiEndpoints.topUp, token!, {"top_up_amount": nominal});
  }

  Future<Map<String, dynamic>> transactionPay(String code) async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    return await _apiService
        .postToken(ApiEndpoints.transaction, token!, {"service_code": code});
  }

  Future<List<Service>?> listPembayran() async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    final response = await _apiService.get(ApiEndpoints.services, token!);

    if (response['message'] == "Sukses") {
      if (response is Map<String, dynamic> && response.containsKey('data')) {
        List<dynamic> serviceList = response['data'];
        return serviceList.map((json) => Service.fromJson(json)).toList();
      }
    } else {
      return null;
    }
    return null;
  }

  Future<List<Transaction>?> fetchTransactions(int offset, int limit) async {
    final SessionManager sessionManager = SessionManager();
    var token = await sessionManager.getToken();
    final response = await _apiService.get(
        '${ApiEndpoints.transactionHistory}?offset=$offset&limit=$limit',
        token!);
    if (response['message'] == 'Get History Berhasil') {
      final data = response;
      List<dynamic> records = data['data']['records'];
      return records.map((json) => Transaction.fromJson(json)).toList();
    } else {
      Get.snackbar('Alert', 'Failed to load transaction history');
      return null;
    }
  }
}
