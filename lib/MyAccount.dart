import 'package:flutter/material.dart';
import 'package:untitled4/Home.dart';
import 'HomeAfter.dart';
import 'Authorization.dart'; // Импортируем экран авторизации
import 'HistoryOrders.dart'; // Импортируем экран истории заказов

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой аккаунт'),
        automaticallyImplyLeading: false, // Убираем кнопку назад из AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/'),
            ),
            SizedBox(height: 20),
            Text(
              'Имя: Дмитрий',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Номер: 79778857294',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Почта: avern.d@yandex.ru',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryOrders()),
                );
              },
              child: Text('История заказов'), // Добавляем кнопку "История заказов"
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAfter()),
                );
              },
              child: Text('На главный экран'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Выйти'), // Добавляем кнопку "Выйти"
            ),
          ],
        ),
      ),
    );
  }
}
