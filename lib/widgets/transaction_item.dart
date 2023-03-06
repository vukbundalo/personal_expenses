import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTransaction,
  });

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 107,
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        transaction.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        DateFormat('dd-MM-yy').format(transaction.date),
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: MediaQuery.of(context).size.width > 500
          ? TextButton.icon(
              onPressed: () => deleteTransaction(transaction.id),
              icon: Icon(Icons.delete,
                  color: Theme.of(context).colorScheme.error),
              label: Text('Delete',
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            )
          : IconButton(
              icon: const Icon(CupertinoIcons.delete),
              onPressed: () => deleteTransaction(transaction.id),
              color: Theme.of(context).colorScheme.error,
            ),
    );
  }
}
