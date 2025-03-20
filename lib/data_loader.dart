import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/account.dart';
import 'models/transaction.dart';

Future<List<Account>> loadAccounts() async {
  final data = await rootBundle.loadString('assets/accounts.json');
  final jsonResult = json.decode(data)['accounts'] as List;
  return jsonResult.map((e) => Account.fromJson(e)).toList();
}

Future<Map<String, List<Transaction>>> loadTransactions() async {
  final data = await rootBundle.loadString('assets/transactions.json');
  print("Data loaded for transactions: $data"); // Debugging line
  final jsonResult = json.decode(data)['transactions'] as Map<String, dynamic>;

  // Add debug prints to check if the transactions are parsed correctly
  jsonResult.forEach((key, value) {
    print("Account Type: $key");
    print("Transactions: $value");
  });

  return jsonResult.map((key, value) {
    return MapEntry(
      key,
      (value as List).map((e) => Transaction.fromJson(e)).toList(),
    );
  });
}
