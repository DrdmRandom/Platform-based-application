import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Import Supabase package
import 'package:starkidy_mobileapp/Components/textField.dart';
import 'package:starkidy_mobileapp/Components/button.dart';
import 'package:starkidy_mobileapp/supabase_service.dart';
import '../Components/bottomNavBarTeacher.dart';
import '../controllers/login_Controller.dart';
import '../controllers/taecherLogin_Controller.dart';

class LoginScreenTeacher extends StatelessWidget {
  LoginScreenTeacher({super.key});

  // text editing controllers
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) {
    SupabaseService.initializeTeacherSupabase().then((_) {
      final loginController = TeacherLoginController(SupabaseService.teacherSupabaseClient);
      loginController.signUserIn(
        context,
        emailAddressController.text,
        passwordController.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome Teacher',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: emailAddressController,
                hintText: 'Email Address',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              MyButton(
                onTap: () => signUserIn(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
