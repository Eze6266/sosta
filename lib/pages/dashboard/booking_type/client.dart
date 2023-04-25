import 'dart:convert';

import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final dynamic photoUrl;
  final dynamic identityCardUrl;
  final dynamic promoCode;
  final dynamic userIp;
  final dynamic userAgent;
  final dynamic firebaseKey;
  final String? defaultRole;
  final int? isVerified;
  final int? isActive;
  final dynamic verificationCode;
  final String? verificationCodeCreatedAt;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Client({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.identityCardUrl,
    this.promoCode,
    this.userIp,
    this.userAgent,
    this.firebaseKey,
    this.defaultRole,
    this.isVerified,
    this.isActive,
    this.verificationCode,
    this.verificationCodeCreatedAt,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Client.fromMap(Map<String, dynamic> data) => Client(
        id: data['id'] as int?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phone_number'] as String?,
        photoUrl: data['photo_url'] as dynamic,
        identityCardUrl: data['identity_card_url'] as dynamic,
        promoCode: data['promo_code'] as dynamic,
        userIp: data['user_ip'] as dynamic,
        userAgent: data['user_agent'] as dynamic,
        firebaseKey: data['firebase_key'] as dynamic,
        defaultRole: data['default_role'] as String?,
        isVerified: data['is_verified'] as int?,
        isActive: data['is_active'] as int?,
        verificationCode: data['verification_code'] as dynamic,
        verificationCodeCreatedAt:
            data['verification_code_created_at'] as String?,
        emailVerifiedAt: data['email_verified_at'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
        'photo_url': photoUrl,
        'identity_card_url': identityCardUrl,
        'promo_code': promoCode,
        'user_ip': userIp,
        'user_agent': userAgent,
        'firebase_key': firebaseKey,
        'default_role': defaultRole,
        'is_verified': isVerified,
        'is_active': isActive,
        'verification_code': verificationCode,
        'verification_code_created_at': verificationCodeCreatedAt,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Client].
  factory Client.fromJson(String data) {
    return Client.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Client] to a JSON string.
  String toJson() => json.encode(toMap());

  Client copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
    dynamic photoUrl,
    dynamic identityCardUrl,
    dynamic promoCode,
    dynamic userIp,
    dynamic userAgent,
    dynamic firebaseKey,
    String? defaultRole,
    int? isVerified,
    int? isActive,
    dynamic verificationCode,
    String? verificationCodeCreatedAt,
    dynamic emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Client(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      identityCardUrl: identityCardUrl ?? this.identityCardUrl,
      promoCode: promoCode ?? this.promoCode,
      userIp: userIp ?? this.userIp,
      userAgent: userAgent ?? this.userAgent,
      firebaseKey: firebaseKey ?? this.firebaseKey,
      defaultRole: defaultRole ?? this.defaultRole,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
      verificationCode: verificationCode ?? this.verificationCode,
      verificationCodeCreatedAt:
          verificationCodeCreatedAt ?? this.verificationCodeCreatedAt,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
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
      firstName,
      lastName,
      username,
      email,
      phoneNumber,
      photoUrl,
      identityCardUrl,
      promoCode,
      userIp,
      userAgent,
      firebaseKey,
      defaultRole,
      isVerified,
      isActive,
      verificationCode,
      verificationCodeCreatedAt,
      emailVerifiedAt,
      createdAt,
      updatedAt,
    ];
  }
}
