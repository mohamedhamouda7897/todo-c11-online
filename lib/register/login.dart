import 'package:flutter/material.dart';
import 'package:todo_c11_online/firebase_functions.dart';
import 'package:todo_c11_online/home.dart';
import 'package:todo_c11_online/register/signUp.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login";

  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SignUpScreen.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: "Don't have an account ?? ",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                TextSpan(
                    text: "SignUp",
                    style: TextStyle(fontSize: 18, color: Colors.blue)),
              ])),
        ),
      ),
      body: Center(
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
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FirebaseFunctions.login(
                    emailController.text, passwordController.text,
                    onSuccess: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.routeName, (route) => false);
                }, onError: (error) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text(error),
                      actions: [
                        ElevatedButton(onPressed: () {}, child: Text("Okay"))
                      ],
                    ),
                  );
                });
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
