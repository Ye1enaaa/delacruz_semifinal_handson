import 'package:delacruz_semifinal_handson/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Hands On by: Dela Cruz',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

