import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_c11_online/firebase_functions.dart';
import 'package:todo_c11_online/register/login.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "SignUp";

  SignUpScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: "I have an account.... ",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                TextSpan(
                    text: "  Login",
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
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
                      emailController.text, passwordController.text,
                      phone: phoneController.text,
                      username: userNameController.text,
                      age: int.parse(ageController.text), onSuccess: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false);
                  }, onError: (message) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(message),
                        actions: [
                          ElevatedButton(onPressed: () {}, child: Text("Yes")),
                          ElevatedButton(onPressed: () {}, child: Text("No"))
                        ],
                      ),
                    );
                  });
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
