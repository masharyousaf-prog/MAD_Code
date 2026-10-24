import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myprovider.dart';
import 'prefrences.dart';
import 'sqfprovider.dart';
import 'sqfliteclass.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Myprovider()),
        ChangeNotifierProvider(create: (context) => Sqfprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic2",
      theme: Provider.of<Myprovider>(context, listen: true).theme,
      initialRoute: '/',
      routes: {
        '/': (context) => PrefrencesClass(),
        '/sqf': (context) => Sqfliteclass(),
        '/add-edit':(context) => AddEditPage()
      },
    );
  }
}
