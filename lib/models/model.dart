import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryWithTotal {
  final String id;
  final String name;
  final double totalAmount;

  CategoryWithTotal({
    required this.id,
    required this.name,
    required this.totalAmount,

  });

  factory CategoryWithTotal.fromJson(Map<String, dynamic> json) {
    return CategoryWithTotal(
      id: json['id'],
      name: json['name'],
      totalAmount: (json['total'] as num).toDouble(),
    );
  }
  static Color _colorFromHex(String hex) {
    final hexCode = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16)); // Add alpha if missing
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'total_amount': totalAmount,
    };
  }
}


class Expense {
  final String id;
  final String categoryId;
  final double amount;
  final DateTime createdAt;

  Expense({
    required this.id,
    required this.categoryId,
    required this.amount,
    required this.createdAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      categoryId: json['category_id'],
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'amount': amount,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
