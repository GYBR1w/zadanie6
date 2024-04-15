import 'package:flutter/material.dart';
import 'CardPage.dart';

class OrderDetailsScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  OrderDetailsScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали заказа'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.network(
              item.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item.name),
            subtitle: Text('Цена: ${item.price}'),
          );
        },
      ),
    );
  }
}
