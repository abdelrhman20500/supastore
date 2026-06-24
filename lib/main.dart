import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supastore/Core/helper/my_observer.dart';
import 'package:supastore/Core/helper/supabase_manager.dart';
import 'package:supastore/Features/Auth/presentation/view/login_view.dart';
import 'package:supastore/Features/layout/presentation/view/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseManager.init();
  Bloc.observer= MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
      // home: session != null ? LayoutScreen() : const LoginView(),
    );
  }
}