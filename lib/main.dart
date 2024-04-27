import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather Application",
      home: HomeScreen(),
    );
  }
}
