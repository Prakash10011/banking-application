import 'package:flutter/material.dart';
import 'transaction_details_screen.dart';
import '../data_loader.dart';
import '../models/account.dart';

class AccountListScreen extends StatelessWidget {
  const AccountListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accounts')),
      body: FutureBuilder<List<Account>>(
        future: loadAccounts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No accounts available'));
          }
          final accounts = snapshot.data!;
          return ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final account = accounts[index];
              return ListTile(
                title: Text('${account.type} - ${account.accountNumber}'),
                subtitle: Text('Balance: \$${account.balance.toStringAsFixed(2)}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TransactionDetailsScreen(accountType: account.type),
                      ),
                    );
                  },
                  child: const Text('View Transactions'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
