import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StateModel {
  String? id;
  String? name;
  String? capital;

  StateModel({
    this.id,
    this.name,
    this.capital,
  });

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      id: map['id'].toString(),
      name: map['name'],
      capital: map["capital"],
    );
  }
}
