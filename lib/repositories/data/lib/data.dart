import 'package:data/models/bank_account.dart';

import 'providers/api_provider.dart';

class DataRepository {
  APIProvider _provider = APIProvider();

  Future<BankAccount> getBankAccountByUser(
          String uuid, Map<String, String> header) =>
      _provider.getBankAccountByUser(uuid, header);
}
