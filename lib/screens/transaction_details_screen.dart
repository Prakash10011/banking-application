import 'package:flutter/material.dart';
import 'package:appbank/models/transaction.dart'; // Import your transaction model
import '../data_loader.dart';
import 'data_loader.dart'; // Import the function to load the transactions

class TransactionDetailsScreen extends StatelessWidget {
  final String accountType;

  const TransactionDetailsScreen({super.key, required this.accountType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$accountType Transactions'),
      ),
      body: FutureBuilder<Map<String, List<Transaction>>>(
        future: loadTransactions(), // Load transactions from the JSON file
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while the data is being fetched
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data![accountType] == null || snapshot.data![accountType]!.isEmpty) {
            // If there are no transactions found for the account type
            return const Center(child: Text('No transactions found.'));
          }

          // Get the list of transactions for the selected account type
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
