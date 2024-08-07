import 'package:e_commerce/app/cart_screen.dart';
import 'package:e_commerce/app/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/app/home_screen.dart';
import 'package:e_commerce/login/create_new_pass.dart';
import 'package:e_commerce/login/reset_pass_screen.dart';
import 'package:e_commerce/login/signup_screen.dart';
import 'package:e_commerce/login/verification_screen.dart';
import 'package:e_commerce/login/welcome_screen.dart';
import 'package:e_commerce/splash/start_screen.dart';

void main() {
  // Initialize GetX controllers
  Get.put(CartController()); // Initialize CartController
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
      routes: {
        '/resetpassscreen': (context) => ResetPassScreen(),
        '/firstscreen': (context) => HomeScreen(),
        '/signupscreen': (context) => SignupScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/verification': (context) => VerificationScreen(),
        '/CreateNewPass': (context) => CreateNewPass(),
        '/cart': (context) => CartScreen(), // Add CartScreen route
      },
    );
  }
}
