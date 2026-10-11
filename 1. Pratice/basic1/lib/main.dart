import "package:flutter/material.dart";
import "main1.dart";
import "main2.dart";
import "main3.dart";
import 'main4.dart';
import 'main5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BasicApp",
      theme: ThemeData(primaryColor: Colors.green),
      initialRoute: "/",
      routes: {
        "/": (context) => const Main1(),
        "/main2": (context) => const Main2(),
        "/main3": (context) => const Main3(),
        "/main4":(context) => const Main4(),
        "/main5":(context) => const Main5()
      },
    );
  }
}