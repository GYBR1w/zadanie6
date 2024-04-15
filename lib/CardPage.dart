import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Order.dart';

class CartItem {
  final String name;
  final String price;
  final String image;
  int quantity; // Добавляем поле для количества товара

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1, // Устанавливаем значение по умолчанию
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
      totalPrice += itemPrice * item.quantity; // Учитываем количество товара
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
                  subtitle: Row(
                    children: [
                      Text(item.price),
                      SizedBox(width: 20), // Добавляем отступ
                      Text('Количество: ${item.quantity}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--; // Уменьшаем количество
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.quantity++; // Увеличиваем количество
                          });
                        },
                      ),
                      IconButton(
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
                    ],
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
                  'Общая стоимость: ${widget.cart.getTotalPrice()} ₽',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: widget.cart.items.isEmpty ? null : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderScreen()),
                    );
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
