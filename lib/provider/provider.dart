import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class ExpenseProvider extends ChangeNotifier {
  
  List<CategoryWithTotal> _categoriesWithTotal =[];
  List<String> _categories = [];
  List<Expense> _expenses = [];
  bool _isLoading = false;
  String? _error;

  List<CategoryWithTotal> get categoriesWithTotal => _categoriesWithTotal;
  List<String> get categories => _categories;
  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;
  String? get error => _error;
  

  Future<void> fetchCategoryWithTotal() async {
    await dotenv.load(fileName: '.env');
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${dotenv.env['BASE_URL']}/category/with-total/d5b2dfe1-c1ca-4785-a1dc-d3c4404ed241'),
        
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _categoriesWithTotal = data.map(
          (json) => CategoryWithTotal.fromJson(json)
        ).toList();
      } else {
        _error = 'Failed to load categories';
      }
    } catch (e) {
      _error = e.toString();
      print(_error);
    }
    _isLoading = false;
    notifyListeners();
  }


  Future<void> fetchCategory() async{
    await dotenv.load(fileName: '.env');
    _isLoading = true;
    notifyListeners();
    try{
      final response = await http.get(Uri.parse('${dotenv.env['BASE_URL']}/category/d5b2dfe1-c1ca-4785-a1dc-d3c4404ed241'));
      if(response.statusCode == 200){
        final List<dynamic> data = json.decode(response.body);
        print(data);
        _categories = data.map((json) => json['name'].toString()).toList();
      }
    }
  catch(e){
    _error = e.toString();
    print(_error);
  }
  
  
}
}