import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

enum TransactionType { received, expense }

class FinancialTransaction {
  String? id;
  TransactionType type;
  double value;
  String name;
  String category;
  String? userId;
  Timestamp? createdAt;

  String get dateFormated => createdAt!.toDate().toLocal().toString();

  FinancialTransaction({
    required this.type,
    required this.value,
    required this.name,
    required this.category,
    this.createdAt,
    this.userId,
    this.id,
  }) {
    createdAt ??= Timestamp.now();
  }

  FinancialTransaction copyWith({
    double? value,
    String? name,
    String? category,
    TransactionType? type,
    String? id,
    String? userId,
  }) {
    return FinancialTransaction(
      type: type ?? this.type,
      value: value ?? this.value,
      name: name ?? this.name,
      category: category ?? this.category,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'name': name,
      'category': category,
      'type': type.name,
      'userId': userId,
      'id': id,
      'createdAt': createdAt,
    };
  }

  factory FinancialTransaction.fromMap(Map<String, dynamic> map) {
    return FinancialTransaction(
      value: map['value']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      type: map['type'] == 'received'
          ? TransactionType.received
          : TransactionType.expense,
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialTransaction.fromJson(String source) =>
      FinancialTransaction.fromMap(json.decode(source));

  @override
  String toString() =>
      'Transaction(value: $value, name: $name, category: $category, type: ${type.name})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FinancialTransaction &&
        other.value == value &&
        other.name == name &&
        other.category == category;
  }

  @override
  int get hashCode => value.hashCode ^ name.hashCode ^ category.hashCode;
}
