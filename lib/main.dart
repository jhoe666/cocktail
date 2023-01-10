import 'package:login/screens/login_screen.dart';
import 'package:login/screens/register_screen.dart';
import 'package:login/services/auth_services.dart';
import 'package:login/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login y tokens',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
          },
        ));
  }
}
