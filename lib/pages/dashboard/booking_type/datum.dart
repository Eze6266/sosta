import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'client.dart';
import 'service.dart';

class Datum extends Equatable {
  final int? id;
  final int? serviceId;
  final int? clientId;
  final String? priceOffered;
  final String? priceQuoted;
  final String? date;
  final String? time;
  final dynamic startTime;
  final dynamic endTime;
  final String? calculatedPrice;
  final int? isPaymentDone;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic cancellation;
  final Client? client;
  final Service? service;

  const Datum({
    this.id,
    this.serviceId,
    this.clientId,
    this.priceOffered,
    this.priceQuoted,
    this.date,
    this.time,
    this.startTime,
    this.endTime,
    this.calculatedPrice,
    this.isPaymentDone,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.cancellation,
    this.client,
    this.service,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        serviceId: data['service_id'] as int?,
        clientId: data['client_id'] as int?,
        priceOffered: data['price_offered'] as String?,
        priceQuoted: data['price_quoted'] as String?,
        date: data['date'] as String?,
        time: data['time'] as String?,
        startTime: data['start_time'] as dynamic,
        endTime: data['end_time'] as dynamic,
        calculatedPrice: data['calculated_price'] as String?,
        isPaymentDone: data['is_payment_done'] as int?,
        status: data['status'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        cancellation: data['cancellation'] as dynamic,
        client: data['client'] == null
            ? null
            : Client.fromMap(data['client'] as Map<String, dynamic>),
        service: data['service'] == null
            ? null
            : Service.fromMap(data['service'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'service_id': serviceId,
        'client_id': clientId,
        'price_offered': priceOffered,
        'price_quoted': priceQuoted,
        'date': date,
        'time': time,
        'start_time': startTime,
        'end_time': endTime,
        'calculated_price': calculatedPrice,
        'is_payment_done': isPaymentDone,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'cancellation': cancellation,
        'client': client?.toMap(),
        'service': service?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    int? id,
    int? serviceId,
    int? clientId,
    String? priceOffered,
    String? priceQuoted,
    String? date,
    String? time,
    dynamic startTime,
    dynamic endTime,
    String? calculatedPrice,
    int? isPaymentDone,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic cancellation,
    Client? client,
    Service? service,
  }) {
    return Datum(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      clientId: clientId ?? this.clientId,
      priceOffered: priceOffered ?? this.priceOffered,
      priceQuoted: priceQuoted ?? this.priceQuoted,
      date: date ?? this.date,
      time: time ?? this.time,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      calculatedPrice: calculatedPrice ?? this.calculatedPrice,
      isPaymentDone: isPaymentDone ?? this.isPaymentDone,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cancellation: cancellation ?? this.cancellation,
      client: client ?? this.client,
      service: service ?? this.service,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      serviceId,
      clientId,
      priceOffered,
      priceQuoted,
      date,
      time,
      startTime,
      endTime,
      calculatedPrice,
      isPaymentDone,
      status,
      createdAt,
      updatedAt,
      cancellation,
      client,
      service,
    ];
  }
}
