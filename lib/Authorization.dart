import 'package:flutter/material.dart';
import 'Home.dart';
import 'Registration.dart';



class Authorization extends StatelessWidget {
  const Authorization ({super.key});

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
                  child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Логин",
                  )
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 400,
                height: 50,
                color: Colors.white,
                child: const Center(
                  child: TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Пароль",
                  )
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Создать аккаунт',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Registration()
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ]
        ),
      ),
    );
  }
}







