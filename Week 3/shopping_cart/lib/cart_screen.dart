import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shopping_cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: Consumer<ShoppingCartModel>(
        builder: (context, shoppingCart, child) {
          final items = shoppingCart.items;

          if (items.isEmpty) {
            return Center(child: Text('Your cart is empty.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    shoppingCart.removeItem(item);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Consumer<ShoppingCartModel>(
        builder: (context, shoppingCart, child) {
          return FloatingActionButton.extended(
            icon: Icon(Icons.delete),
            onPressed: shoppingCart.clearCart,
            label: Text('Clear Cart'),
          );
        },
      ),
    );
  }
}
