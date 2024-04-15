import 'package:flutter/material.dart';
import 'package:untitled4/HomeAfter.dart';
import 'Home.dart';

class OrderFinishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ успешно оформлен'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Заказ успешно оформлен!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Ожидайте звонка для подтверждения',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAfter()),
                );
              },
              child: Text('Вернуться на главный экран'),
            ),
          ],
        ),
      ),
    );
  }
}