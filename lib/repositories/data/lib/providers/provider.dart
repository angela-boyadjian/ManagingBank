import 'package:data/models/bank_account.dart';

abstract class AProvider {
  Future<BankAccount> getBankAccountByUser(
      String uuid, Map<String, String> header);
}
