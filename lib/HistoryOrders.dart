import 'package:flutter/material.dart';

class Order {
  final int orderNumber;
  final String date;

  Order({required this.orderNumber, required this.date});
}

class HistoryOrders extends StatefulWidget {
  @override
  _HistoryOrdersState createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      orders.add(Order(orderNumber: i + 1, date: '01.01.2023'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История заказов'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text('Заказ номер ${order.orderNumber}'),
            subtitle: Text('Дата: ${order.date}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetails(order: order),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final Order order;

  const OrderDetails({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ номер ${order.orderNumber}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Детали заказа номер ${order.orderNumber}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Дата заказа: ${order.date}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
