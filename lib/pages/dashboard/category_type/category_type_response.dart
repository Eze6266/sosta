import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'category_type.dart';

class CategoryTypeResponse extends Equatable {
  final bool? status;
  final String? code;
  final String? message;
  final List<CategoryType>? data;

  const CategoryTypeResponse({this.status, this.code, this.message, this.data});

  factory CategoryTypeResponse.fromMap(Map<String, dynamic> data) =>
      CategoryTypeResponse(
        status: data['status'] as bool?,
        code: data['code'] as String?,
        message: data['message'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => CategoryType.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryTypeResponse].
  factory CategoryTypeResponse.fromJson(String data) {
    return CategoryTypeResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryTypeResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CategoryTypeResponse copyWith({
    bool? status,
    String? code,
    String? message,
    List<CategoryType>? data,
  }) {
    return CategoryTypeResponse(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code, message, data];
}
