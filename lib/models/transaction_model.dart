
import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  String? reference;
  String? amount;
  String? created_at;

  TransactionModel({
    this.reference,
    this.amount,
    this.created_at,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      reference: map['reference'],
      amount: map['amount'].toString(),
      created_at: map["created_at"],
    );
  }
}
