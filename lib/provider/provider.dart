import 'package:flutter/material.dart';

class Transactions extends ChangeNotifier {

  final List<Map<String, dynamic>> _transactionsData = [
    {
    'name': 'Food',
    'totalAmount': 45.00,
  },
  {
    'name': 'Shopping',
    'totalAmount': 230.00,
  },
  {
    'name': 'Health',
    'totalAmount': 79.00,
  },
  {
    'name': 'Travel',
    'totalAmount': 350.00,
  }
  ];

  List<Map<String, dynamic>> get transactionsData => _transactionsData;

  double get totalPrice{
    double total = 0;
    for(var item in _transactionsData){
      total += item['totalAmount'];
    }
    return total;
  }

  void updateExpense(String category, double amt){
    for(var item in _transactionsData){
      if(item['name'] == category){
        item['totalAmount'] += amt;
        break;
      }
    }
    notifyListeners();
  }
  
}
