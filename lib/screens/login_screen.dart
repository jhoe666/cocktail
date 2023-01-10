import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var result = authService.signInWithEmailAndPassword(
                    emailController.text, passwordController.text);
                if (result == null) {
                  Fluttertoast.showToast(
                    msg: "Correo ya existe",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register'),
            ),
          ],
        ));
  }
}
