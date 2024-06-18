import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient supabaseClient = SupabaseClient(
    'https://quixunexplcapuhdsbbw.supabase.co', // Replace with your Supabase project URL
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF1aXh1bmV4cGxjYXB1aGRzYmJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg3MTYxNTksImV4cCI6MjAzNDI5MjE1OX0.zcOi8BC_JwUxKz2usAZ5NrAnQZmn7Q7W8kT7PekNATs', // Replace with your Supabase public anon key
  );

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://quixunexplcapuhdsbbw.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF1aXh1bmV4cGxjYXB1aGRzYmJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg3MTYxNTksImV4cCI6MjAzNDI5MjE1OX0.zcOi8BC_JwUxKz2usAZ5NrAnQZmn7Q7W8kT7PekNATs',
    );
  }
}
