import 'package:flutter/material.dart';
import 'package:tesla/screens/HomeScreen/ui/home_screens.dart';

void main() {
  runApp(MaterialApp(
    title: "Tesla",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
