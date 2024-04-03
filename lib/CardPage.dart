import 'package:flutter/material.dart';
import 'modul/DataBase.dart';

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

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in items) {
      double itemPrice = getPriceByName(item.name);
      totalPrice += itemPrice;
    }
    return totalPrice;
  }
}

class CartScreen extends StatefulWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (context, index) {
                final item = widget.cart.items[index];
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
                      setState(() {
                        widget.cart.removeItem(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Товар удален из корзины'),
                        duration: Duration(seconds: 1),
                      ));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Общая стоимость: ${widget.cart.getTotalPrice()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии на кнопку оформления заказа
                  },
                  child: Text('Оформить заказ'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
