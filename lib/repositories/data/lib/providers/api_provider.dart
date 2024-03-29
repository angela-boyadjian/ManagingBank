import 'provider.dart';
import 'package:http/http.dart' as http;

import 'package:data/models/transactions.dart';
import 'package:data/models/bank_account.dart';
import 'package:data/constants/constants.dart' as constants;

class APIProvider extends AProvider {
  _getApiCall(String url, Map<String, String> header) async {
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode != 200) throw Exception();
    return (response.body);
  }

  @override
  Future<BankAccount> getBankAccountByUser(
      String uuid, Map<String, String> header) async {
    return bankAccountFromJson(
        await _getApiCall("${constants.bankAccountByUserUrl}$uuid", header));
  }

  @override
  Future<Transactions> getTransactions(
      String uuid, Map<String, String> header, int page) async {
    return transactionsFromJson(await _getApiCall(
        "${constants.transactionsUrl}$uuid&page=$page&per_page=5", header));
  }
}
