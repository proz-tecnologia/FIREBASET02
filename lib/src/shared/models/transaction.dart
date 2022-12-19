import 'dart:convert';

import 'package:flutter/foundation.dart';

enum TransactionType { received, expense }

class FinancialTransaction {
  String? id;
  TransactionType type;
  double value;
  String name;
  String category;

  FinancialTransaction({
    required this.type,
    required this.value,
    required this.name,
    required this.category,
    this.id,
  });

  FinancialTransaction copyWith({
    double? value,
    String? name,
    String? category,
    TransactionType? type,
    String? id,
  }) {
    return FinancialTransaction(
      type: type ?? this.type,
      value: value ?? this.value,
      name: name ?? this.name,
      category: category ?? this.category,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'name': name,
      'category': category,
      'type': type.name,
    };
  }

  factory FinancialTransaction.fromMap(Map<String, dynamic> map) {
    return FinancialTransaction(
      value: map['value']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      id: map['id'] ?? '',
      type: map['type'] == 'received'
          ? TransactionType.received
          : TransactionType.expense,
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
