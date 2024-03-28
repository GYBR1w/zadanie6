import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String price;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
  });
}

class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            leading: Image.network(
              item.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item.name),
            subtitle: Text(item.price),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cart.removeItem(index);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Товар удален из корзины'),
                  duration: Duration(seconds: 2),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
