import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:starkidy_mobileapp/Pages/homePage.dart';
import 'package:starkidy_mobileapp/supabase_service.dart';

class LoginController {
  final SupabaseClient _supabaseClient = SupabaseService.supabaseClient;

  Future<void> signUserIn(BuildContext context, String email, String password) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Signing In..."),
              ],
            ),
          ),
        );
      },
    );

    try {
      final response = await _supabaseClient.auth.signInWithPassword(email: email, password: password);
      print('AuthResponse: ${response.session}, User: ${response.user}');

      // Dismiss the loading dialog
      Navigator.pop(context);

      if (response.session != null) {
        print('Sign in successful!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Since Supabase does not provide detailed errors, assume any non-success is a password error
        showErrorSnackbar(context, 'Incorrect password');
      }
    } catch (e) {
      // Dismiss the loading dialog
      Navigator.pop(context);

      print('Exception during sign in: $e');
      showErrorSnackbar(context, parseErrorMessage(e.toString(), email));
    }
  }

  void showErrorSnackbar(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
  }

  String parseErrorMessage(String errorMessage, String attemptedEmail) {
    // Example error message handling, adjust based on actual API responses
    if (errorMessage.contains('does not exist')) {
      return 'This User/Email is not registered. Please contact Administration';
    } else if (errorMessage.contains('Incorrect password')) {
      return 'Incorrect password';
    } else {
      return 'User/Email or Password is incorrect please check again';
    }
  }
}
