import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubCategoryModel {
  String? id;
  String? category_id;
  String? name;

  SubCategoryModel({
    this.id,
    this.name,
    this.category_id,
  });

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'].toString(),
      name: map['name'],
      category_id: map["category_id"].toString(),
    );
  }
}
