import 'package:ecommerce_app/screens/signup_screen.dart';
import 'package:ecommerce_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:  Color(0xFFE8E8E8),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}