Flutter Banking Application:

This is a simple mobile banking application built using Flutter. It allows users to interact with mock data in JSON format and provides a user-friendly interface to view bank accounts and transactions.

Features:
Welcome Screen: Displays the bank's logo, a welcome message, and today's date.
Account List: Displays the user's bank accounts, including account type, account number, and balance.
Transaction Details: Allows users to view detailed transaction information for a selected account, including date, description, and amount.
Navigation Flow:
Users can navigate from the Welcome Screen to the Account List.
From the Account List, users can navigate to the Transaction Details of the selected account.
Navigation back is only allowed from the Transaction Details to the Account List, and from the Account List to the Welcome Screen.

Folder Structure:
assets/: Contains the JSON files for accounts and transactions.

accounts.json: Holds data for bank accounts.
transactions.json: Contains transaction details for different account types.
lib/: Contains all the main code for the app.

main.dart: The entry point for the Flutter app.
data_loader.dart: Contains logic for loading data from JSON files.
models/: Contains Dart classes for Account and Transaction data models.
screens/: Contains different screens/views for the app (Welcome Screen, Account List Screen, Transaction Details Screen).
widgets/: Contains reusable UI components.

Features Explained:
Welcome Screen: The welcome screen is the first screen users see. It displays the bank's logo, a welcome message, and today's date. It also provides a button to navigate to the account list.

Account List Screen: This screen fetches the list of accounts from the JSON file and displays them in a list with account type, account number, and balance. Users can navigate to the transaction details screen by tapping on the "View Transactions" button.

Transaction Details Screen: Once a user selects an account from the Account List, they are navigated to the Transaction Details screen. This screen shows the transactions for the selected account, including the date, description, and amount of each transaction. Positive and negative amounts are displayed in green and red, respectively.

Assets:
The project uses two main assets (stored in the assets/ folder):

accounts.json: Contains mock account data, including account types, account numbers, and balances.
transactions.json: Contains mock transaction data for each account type (Chequing, Savings), including the transaction date, description, and amount.