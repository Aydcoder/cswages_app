import 'package:cswages/custom_widgets/transaction.dart';
import 'package:cswages/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Transaction> transactions = <Transaction>[
    Transaction(
        dateAndTime: "Dec 01, 2022 07:03PM",
        description: "Investment Profit #938528",
        amount: 80294,
        isDebit: false),
    Transaction(
        dateAndTime: "Dec 02, 2022 05:32PM",
        description: "New Investment #0392842",
        amount: 80294,
        isDebit: true),
    Transaction(
        dateAndTime: "Now 28, 2021 02:32PM",
        description: "New Withdrawal #0392842",
        amount: 80294,
        isDebit: true),
    Transaction(
        dateAndTime: "Dec 01, 2022 07:03PM",
        description: "Referral Commission (Rex)",
        amount: 102494,
        isDebit: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          const BalanceWidget(),
          const SizedBox(height: 20),
          const TradingButtons(),
          //  Divider(
          //   height: 40,
          //   thickness: 2,
          // ),
          const SizedBox(height: 25),

          RecentTrasactionsWidget(transactions: transactions),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/offer.jpeg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}

class RecentTrasactionsWidget extends StatelessWidget {
  const RecentTrasactionsWidget({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "View Transaction History",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 20, thickness: 2),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return TransactionWidget(transaction: transactions[index]);
                },
                itemCount: transactions.length,
                separatorBuilder: (BuildContext context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/finance.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "USABLE BALANCE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "202,402.03",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_rounded),
          ),
        ],
      ),
    );
  }
}

class TradingButtons extends StatelessWidget {
  const TradingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Invest",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Withdraw",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.share,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Refer us",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
