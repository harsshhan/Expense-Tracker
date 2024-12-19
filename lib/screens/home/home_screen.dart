import 'dart:math';

import 'package:expense_tracker/provider/provider.dart';
import 'package:expense_tracker/screens/home/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stats/stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _category = '';
  double _amount = 0.0;

  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();


  @override
  void dispose() {
    _categoryController.dispose();
    _expenseController.dispose();
    super.dispose();
  }


  void _saveExpense() {
    final transactionsProvider = Provider.of<Transactions>(context,listen:false);
    if (_formKey.currentState!.validate()) {
      _category = _category;
      _amount = double.parse(_expenseController.text);
      transactionsProvider.updateExpense(_category, _amount);
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Expense added successfully")));
    }
  }

  var widgetList = [
    MainScreen(),
    StatScreen(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: index == 0 ? Colors.blue : Colors.grey,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.graph_square,
                    color: index == 1 ? Colors.blue : Colors.grey,
                  ),
                  label: 'Graph'),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              
              builder: (context)=>AlertDialog(
                
                title: Text("Add Expense"),
                content: SizedBox(
                  width: double.maxFinite,
                  height: 200,
                  child: Form(
                    key: _formKey,
                      child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _category.isEmpty ? null : _category,
                        decoration: InputDecoration(
                          labelText: "Category",
                          border: OutlineInputBorder(),
                        ),
                        hint: Text("Select a Category"),
                        items: [
                          "Food",
                          "Shopping",
                          "Health",
                          "Travel"
                        ].map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _category = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Select a category";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        controller: _expenseController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Amount', hintText: 'e.g 250'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the amount";
                          }
                          return null;
                        },
                      )
                    ],
                  )),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Cancel")),
                  TextButton(onPressed: _saveExpense, child: Text("Add")) // Add the onPressed callback to invoke _saveExpense
                ],
              ),
            );
            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AddExpense()));
          },
          shape: CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      transform: GradientRotation(pi / 4),
                      colors: [
                        Theme.of(context).colorScheme.tertiary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary,
                      ])),
              child: Icon(Icons.add))),
      body: widgetList[index],
    );
  }
}
