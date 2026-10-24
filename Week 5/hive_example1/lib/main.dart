import 'dart:async';
import 'package:flutter/material.dart';
import 'hive_box_const.dart';
import 'home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  // It is used so that void main function can
  // be intiated after successfully intialization of data
  WidgetsFlutterBinding.ensureInitialized();

  // To intialise the hive database
  await Hive.initFlutter();

  // To open the user hive box
  await Hive.openBox(userHiveBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomeScreen()
       );
  }
}