import 'package:data/models/spendings.dart';
import 'package:data/models/bank_account.dart';
import 'package:data/models/transactions.dart';

import 'providers/api_provider.dart';

class DataRepository {
  APIProvider _provider = APIProvider();

  Future<BankAccount> getBankAccountByUser(
          String uuid, Map<String, String> header) =>
      _provider.getBankAccountByUser(uuid, header);

  Future<Transactions> getTransactions(
          String uuid, Map<String, String> header, int page) =>
      _provider.getTransactions(uuid, header, page);

  Future<Spendings> getSpendings(String uuid, Map<String, String> header,
          String orgUuid, String period) =>
      _provider.getSpendings(uuid, header, orgUuid, period);
}
