import 'package:data/models/bank_account.dart';
import 'package:data/models/transactions.dart';

abstract class AProvider {
  Future<BankAccount> getBankAccountByUser(
      String uuid, Map<String, String> header);

  Future<Transactions> getTransactions(
      String uuid, Map<String, String> header, int page);
}
