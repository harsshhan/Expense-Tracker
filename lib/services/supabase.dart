import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final SupabaseClient client = Supabase.instance.client;

  Future<void> addExpense(String userid, String category, double amount, DateTime expenseDate) async {
    await client.from('expenses').insert({
      'user_id': userid,
      'category': category,
      'amount': amount,
      'expense_date': expenseDate.toIso8601String()
    });
  }

  Future<List<Map<String, dynamic>>> getExpenses(String userid) async {
    final response = await client
        .from('expenses')
        .select('*')
        .eq('user_id', userid)
        .order('expense_date', ascending: false);

    return List<Map<String, dynamic>>.from(response ?? []);
  }

  Future<void> deleteExpense(String expenseId) async {
    await client.from('expenses').delete().eq('id', expenseId);
  }
}