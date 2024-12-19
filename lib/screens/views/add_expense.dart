// import 'package:flutter/material.dart';

// class AddExpense extends StatelessWidget {
//   const AddExpense({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     String category = '';
//     double amount = 0.0;

//     final TextEditingController categoryController = TextEditingController();
//     final TextEditingController expenseController = TextEditingController();


//     void saveExpense() {
//     if(formKey.currentState!.validate()){
//       category = categoryController.text;
//       amount = double.parse(expenseController.text);

//       Navigator.of(context).pop();

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Expense added successfully"))
//       );
//     }
//   } 
//     return AlertDialog(
//       title: Text("Add Expense"),
//       content: Form(
//         child: Column(
//           children: [
//             TextFormField(
//               controller: categoryController,
//               decoration: InputDecoration(
//                 labelText: "Category",
//                 hintText: "Food,Shopping"
//               ),
//               validator: (value){
//                 if(value == null || value.isEmpty){
//                   return "Please Select a category";
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: expenseController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 hintText: 'e.g 250'
//               ),
//               validator: (value) {
//                 if(value == null ||value.isEmpty){
//                   return "Please enter the amount";
//                 }
//                 return null;
//               },
//             )
//           ],
//         )
//         ),
//         actions: [
//           TextButton(onPressed: ()=> Navigator.of(context).pop(), child: Text("Cancel")),
//           TextButton(onPressed: saveExpense, child: Text("Add"))
//         ],
//     );
//   }

  
// }
