import 'dart:convert';

import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int? id;
  final int? userId;
  final int? categoryId;
  final int? stateId;
  final String? name;
  final String? closestLandmark;
  final String? address;
  final String? city;
  final String? description;
  final dynamic imageUrl;
  final dynamic skills;
  final String? chargeType;
  final String? openingTime;
  final String? closingTime;
  final String? minCharge;
  final String? maxCharge;
  final bool? isActive;
  final bool? isApproved;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Service({
    this.id,
    this.userId,
    this.categoryId,
    this.stateId,
    this.name,
    this.closestLandmark,
    this.address,
    this.city,
    this.description,
    this.imageUrl,
    this.skills,
    this.chargeType,
    this.openingTime,
    this.closingTime,
    this.minCharge,
    this.maxCharge,
    this.isActive,
    this.isApproved,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromMap(Map<String, dynamic> data) => Service(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        categoryId: data['category_id'] as int?,
        stateId: data['state_id'] as int?,
        name: data['name'] as String?,
        closestLandmark: data['closest_landmark'] as String?,
        address: data['address'] as String?,
        city: data['city'] as String?,
        description: data['description'] as String?,
        imageUrl: data['image_url'] as dynamic,
        skills: data['skills'] as dynamic,
        chargeType: data['charge_type'] as String?,
        openingTime: data['opening_time'] as String?,
        closingTime: data['closing_time'] as String?,
        minCharge: data['min_charge'] as String?,
        maxCharge: data['max_charge'] as String?,
        isActive: data['is_active'] as bool?,
        isApproved: data['is_approved'] as bool?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'category_id': categoryId,
        'state_id': stateId,
        'name': name,
        'closest_landmark': closestLandmark,
        'address': address,
        'city': city,
        'description': description,
        'image_url': imageUrl,
        'skills': skills,
        'charge_type': chargeType,
        'opening_time': openingTime,
        'closing_time': closingTime,
        'min_charge': minCharge,
        'max_charge': maxCharge,
        'is_active': isActive,
        'is_approved': isApproved,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Service].
  factory Service.fromJson(String data) {
    return Service.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Service] to a JSON string.
  String toJson() => json.encode(toMap());

  Service copyWith({
    int? id,
    int? userId,
    int? categoryId,
    int? stateId,
    String? name,
    String? closestLandmark,
    String? address,
    String? city,
    String? description,
    dynamic imageUrl,
    dynamic skills,
    String? chargeType,
    String? openingTime,
    String? closingTime,
    String? minCharge,
    String? maxCharge,
    bool? isActive,
    bool? isApproved,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Service(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      stateId: stateId ?? this.stateId,
      name: name ?? this.name,
      closestLandmark: closestLandmark ?? this.closestLandmark,
      address: address ?? this.address,
      city: city ?? this.city,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      skills: skills ?? this.skills,
      chargeType: chargeType ?? this.chargeType,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      minCharge: minCharge ?? this.minCharge,
      maxCharge: maxCharge ?? this.maxCharge,
      isActive: isActive ?? this.isActive,
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      categoryId,
      stateId,
      name,
      closestLandmark,
      address,
      city,
      description,
      imageUrl,
      skills,
      chargeType,
      openingTime,
      closingTime,
      minCharge,
      maxCharge,
      isActive,
      isApproved,
      createdAt,
      updatedAt,
    ];
  }
}
