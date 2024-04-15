import 'package:flutter/material.dart';
import 'Order.dart';
import 'modul/DataBase.dart';
import 'CardPage.dart';

class HistoryOrders extends StatefulWidget {
  @override
  _HistoryOrdersState createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  List<List<CartItem>> ordersHistory = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      List<CartItem> randomItems = [];
      for (int j = 0; j < 3; j++) {
        int randomIndex = DateTime.now().millisecond % flowersList.length;
        randomItems.add(CartItem(
          name: flowersList[randomIndex].name,
          price: flowersList[randomIndex].price,
          image: flowersList[randomIndex].image,
        ));
      }
      addOrderToHistory(randomItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История заказов'),
      ),
      body: ListView.builder(
        itemCount: ordersHistory.length,
        itemBuilder: (context, index) {
          final order = ordersHistory[index];
          return ListTile(
            title: Text('Заказ номер ${index + 1}'),
            subtitle: Text('Количество товаров: ${order.length}'),
            onTap: () {
            },
          );
        },
      ),
    );
  }

  void addOrderToHistory(List<CartItem> cartItems) {
    setState(() {
      ordersHistory.add(cartItems);
    });
  }
}
