import 'package:flutter/material.dart';
import 'package:starkidy_mobileapp/components/textField.dart';
import 'package:starkidy_mobileapp/components/button.dart';
import 'package:starkidy_mobileapp/controllers/login_Controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // text editing controllers
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( // Added SingleChildScrollView to avoid overflow issues
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                const Text(
                  'Welcome Student',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: emailAddressController,
                  hintText: 'Email Address',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

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
                  onTap: () => _loginController.signUserIn(
                      context,
                      emailAddressController.text,
                      passwordController.text
                  ), // Pass context and user input to the signUserIn method
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
