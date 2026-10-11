import 'package:shopping_cart/shopping_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingCartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListScreen(),
    );
  }
}
