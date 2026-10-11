import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/shopping_cart_model.dart';

import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  static final List<String> products = [
    'Apples',
    'Bananas',
    'Oranges',
    'Grapes',
    'Strawberries',
  ];
  @override
  Widget build(BuildContext context) {
    final shoppingCart = Provider.of<ShoppingCartModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product),
            trailing: ElevatedButton(
              onPressed: () {
                shoppingCart.addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$product added to cart'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}
