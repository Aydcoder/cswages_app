class Transaction {
  final String dateAndTime;
  final String description;
  final int amount;
  final bool isDebit;

  Transaction(
      {required this.dateAndTime,
      required this.description,
      required this.amount,
      required this.isDebit});
}
