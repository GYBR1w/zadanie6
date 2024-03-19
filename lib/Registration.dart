import 'package:flutter/material.dart';

import 'Authorization.dart';



//Экран регистрации
class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Регистрация'),
        ),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
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
              const SizedBox(height: 45),
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
              const SizedBox(height: 45),
              Container(
                width: 400,
                height: 50,
                color: Colors.white,
                child: const Center(
                  child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Почта",
                      fillColor: Colors.white,
                      filled: true
                  )
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Container(
                width: 400,
                height: 50,
                color: Colors.white,
                child: const Center(
                  child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Телефон",
                      fillColor: Colors.white,
                      filled: true
                  )
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Container(
                width: 300,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Authorization()
                      ),
                    );
                  },
                  child: const Text('Зарегистрироваться',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          )
      ),
    );
  }
}