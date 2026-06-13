import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supastore/Features/Auth/presentation/view/login_view.dart';
import 'package:supastore/Core/helper/supabase_manager.dart';
import 'package:supastore/Features/home_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseManager.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;
    final user = client.auth.currentUser;

    ///   طباعة لمعرفة الحالة
    print("Current User: $user");
    print("Session: ${client.auth.currentSession}");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? const HomeView() : LoginView(),
    );
  }
}