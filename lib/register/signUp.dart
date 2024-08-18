import 'package:flutter/material.dart';
import 'package:todo_c11_online/firebase_functions.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "signUp";

  SignUpScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Screen'),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: "I have an account ?? ",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                TextSpan(
                    text: "Login",
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ])),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'UserName',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  FirebaseFunctions.createAccount(
                      emailController.text,
                      passwordController.text,
                      usernameController.text,
                      phoneController.text,
                      int.parse(ageController.text));
                },
                child: const Text('SignUp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
