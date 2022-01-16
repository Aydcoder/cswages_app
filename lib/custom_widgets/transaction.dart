import 'package:cswages/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;
  const TransactionWidget({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _iconColor = transaction.isDebit ? Colors.red : Colors.green;
    final _iconBgColor =
        transaction.isDebit ? Colors.red[100] : Colors.green[100];
    final _debitOperator = transaction.isDebit ? "-" : "+";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: _iconBgColor),
            child: transaction.isDebit
                ? Icon(
                    Icons.arrow_downward,
                    color: _iconColor,
                  )
                : Icon(
                    Icons.arrow_upward,
                    color: _iconColor,
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction.dateAndTime,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      _debitOperator + " " + transaction.amount.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _iconColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  transaction.description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
