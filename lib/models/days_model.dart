
import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DaysModel {
  String? id;
  String? name;
  String? abbr;

  DaysModel({
    this.id,
    this.name,
    this.abbr,
  });

  factory DaysModel.fromMap(Map<String, dynamic> map) {
    return DaysModel(
      id: map['id'].toString(),
      name: map['name'],
      abbr: map["abbr"],
    );
  }
}
