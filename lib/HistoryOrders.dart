import 'package:flutter/material.dart';
import 'CardPage.dart';
import 'modul/DataBase.dart';
import 'OrderDetailsScreen.dart';


class HistoryOrders extends StatefulWidget {
  @override
  _HistoryOrdersState createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  List<List<CartItem>> ordersHistory = [];

  @override
  void initState() {
    super.initState();

    List<CartItem> order1 = [
      CartItem(
        name: flowersList[0].name,
        price: flowersList[0].price,
        image: flowersList[0].image,
        quantity: 1,
      ),
    ];


    List<CartItem> order2 = [
      CartItem(
        name: flowersList[1].name,
        price: flowersList[1].price,
        image: flowersList[1].image,
        quantity: 2,
      ),
    ];


    ordersHistory.add(order1);
    ordersHistory.add(order2);
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(cartItems: order),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
