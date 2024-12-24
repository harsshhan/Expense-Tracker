// import 'package:expense_tracker/data/category_data.dart';
// import 'package:expense_tracker/provider/provider.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


// class Chart extends StatelessWidget {
//   const Chart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final transactionsData = Provider.of<ExpenseProvider>(context).expenses;
//     double totalSpent = transactionsData.fold(
//       0, (sum, item) => sum + item['totalAmount']
//     );

//     List<PieChartSectionData> sections = transactionsData.map((transaction) {
//       final name = transaction['name'];
//       double percentage = (transaction['totalAmount'] / totalSpent) * 100;
//       return PieChartSectionData(
//         value: transaction['totalAmount'],
//         color: categoryData[name]!['color'],
//         title: '${transaction['name']} ${(percentage).toStringAsFixed(1)}%',
//         radius: 50,
//         titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
//       );
//     }).toList();

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: PieChart(
//         PieChartData(
//           sections: sections,
//           sectionsSpace: 4, 
//           centerSpaceRadius: 120, 
//         ),
        
//       ),
//     );
//   }
// }