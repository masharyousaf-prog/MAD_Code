import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_edit_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider()..fetchItems(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider CRUD App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add-edit': (context) => const AddEditScreen(),
      },
    );
  }
}