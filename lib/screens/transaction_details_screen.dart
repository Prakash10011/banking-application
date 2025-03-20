import 'package:flutter/material.dart';
import '../data_loader.dart';
import '../models/transaction.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final String accountType;

  const TransactionDetailsScreen({Key? key, required this.accountType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$accountType Transactions')),
      body: FutureBuilder<Map<String, List<Transaction>>>(
        future: loadTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data![accountType] == null) {
            return const Center(child: Text('No transactions found'));
          }
          final transactions = snapshot.data![accountType]!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return ListTile(
                title: Text(transaction.description),
                subtitle: Text(transaction.date),
                trailing: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: transaction.amount < 0 ? Colors.red : Colors.green,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
