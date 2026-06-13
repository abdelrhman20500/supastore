import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager{
  static Future<void> init()async{
    Supabase.initialize(
        url: "https://anbxdoyvsflalbltnbcb.supabase.co",
      publishableKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFuYnhkb3l2c2ZsYWxibHRuYmNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODEyNTI4MTEsImV4cCI6MjA5NjgyODgxMX0.WAFMIuGHbTP5y5IhmE9cUthMLiG7Cxv01HLit-JfWpM"
    );
  }
}