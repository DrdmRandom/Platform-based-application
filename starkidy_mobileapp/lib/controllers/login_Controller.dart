import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:starkidy_mobileapp/Pages/homePage.dart'; // Import homePage
import 'package:starkidy_mobileapp/supabase_service.dart'; // Import SupabaseService

class LoginController {
  final SupabaseClient _supabaseClient = SupabaseService.supabaseClient;

  Future<void> signUserIn(BuildContext context, String email, String password) async {
    print('Attempting to sign in...');
    try {
      final AuthResponse response = await _supabaseClient.auth.signInWithPassword(email: email, password: password);
      print('AuthResponse: ${response.session}, User: ${response.user}'); // Print relevant information


      if (response.session != null) {
        print('Sign in successful!');
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()), // Navigate to homePage
        );
      } else {
        // Handle login error
        String errorMessage = 'Unknown error';
        if (response.user == null) {
          errorMessage = 'Invalid credentials';
        }
        print('Sign in failed: $errorMessage');
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login failed: $errorMessage'),
        ));
      }
    } catch (e) {
      // Handle exception
      print('Exception during sign in: $e');
      String errorMessage = e.toString().contains('password') ? 'Incorrect password' : 'Invalid email/user';
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed: $errorMessage'),
      ));
    }
  }
}
