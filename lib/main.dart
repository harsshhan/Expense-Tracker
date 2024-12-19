import 'package:expense_tracker/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'provider/provider.dart';

Future<void> main() async {

  await Supabase.initialize(
    url: "https://oenuclzujhjuoobvgrkt.supabase.co"
  , anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9lbnVjbHp1amhqdW9vYnZncmt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5NTM0NzksImV4cCI6MjA0NzUyOTQ3OX0.loDv6kDl2KrYNBPc2dHaV3ZdXZFONxmerKVuorLI7nQ');
  runApp(
    ChangeNotifierProvider(
      create: (_) => Transactions(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}