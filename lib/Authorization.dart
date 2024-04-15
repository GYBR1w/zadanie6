import 'package:flutter/material.dart';
import 'package:untitled4/MyAccount.dart';
import 'Home.dart';
import 'Registration.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Авторизация'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              width: 400,
              height: 50,
              color: Colors.white,
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Логин",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 400,
              height: 50,
              color: Colors.white,
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Пароль",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: 300,
              height: 70,
              child: ElevatedButton(
                child: const Text(
                  'Войти',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                  // Здесь должна быть логика аутентификации
                  // Пока просто перенаправляем на экран Home.dart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyAccount()),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}