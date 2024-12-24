import 'dart:math';

import 'package:expense_tracker/data/category_data.dart';
import 'package:expense_tracker/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch categories with totals when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExpenseProvider>().fetchCategoryWithTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(builder: (context, provider, child) {
      double totalExpense = provider.categoriesWithTotal
          .fold(0, (sum, category) => sum + category.totalAmount);

      List<Map<String, dynamic>> transactionsData = [
        {
          'icon': const FaIcon(FontAwesomeIcons.burger, color: Colors.white),
          'color': Colors.yellow[700],
          'name': 'Food',
        },
        {
          'icon':
              const FaIcon(FontAwesomeIcons.bagShopping, color: Colors.white),
          'color': Colors.purple,
          'name': 'Shopping',
        },
        {
          'icon': const FaIcon(FontAwesomeIcons.heartCircleCheck,
              color: Colors.white),
          'color': Colors.green,
          'name': 'Health',
        },
        {
          'icon': const FaIcon(FontAwesomeIcons.plane, color: Colors.white),
          'color': Colors.blue,
          'name': 'Travel',
        },
        {
          'icon': const FaIcon(FontAwesomeIcons.baseball, color: Colors.white),
          'color': Colors.lightBlue,
          'name': 'Sports',
        }
      ];
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.orange[700]),
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Harshan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          offset: Offset(3, 3),
                          blurRadius: 4),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        transform: GradientRotation(pi / 4),
                        colors: [
                          Theme.of(context).colorScheme.tertiary,
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.primary,
                        ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Total Expenses",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    // SizedBox(height: 5,),
                    Text(
                      totalExpense.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Text(
                  //     "View All",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w400,
                  //         fontSize: 16,
                  //         color: Colors.grey.shade500),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              if (provider.isLoading)
                Center(child: CircularProgressIndicator())
              else if (provider.error != null)
                Center(child: Text(provider.error!))
              else if (provider.categoriesWithTotal.isEmpty)
                Center(child: Text("No transactions found"))
              else
                Expanded(
                    child: ListView.builder(
                        itemCount: transactionsData.length,
                        itemBuilder: (context, index) {
                          
                          final category = transactionsData[index]['name'];
                          final provider_category = provider.categoriesWithTotal.firstWhere((cat)=>cat.name == category);
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: transactionsData[index]
                                                  ['color'],
                                              shape: BoxShape.circle),
                                          child: 
                                            transactionsData[index]['icon'],
                                            // color: Colors.white,
                                        
                                          alignment: Alignment.center,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          category,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '- ₹${provider_category.totalAmount}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        // Text(
                                        //   transactions[index]['date'],
                                        //   style: TextStyle(
                                        //       fontSize: 14,
                                        //       color: Theme.of(context)
                                        //           .colorScheme
                                        //           .outline,
                                        //           fontWeight: FontWeight.w400),
                                        // )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }))
            ],
          ),
        ),
      );
    });
  }
}
