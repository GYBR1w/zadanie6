import 'package:flutter/material.dart';
import 'modul/DataBase.dart';
import 'Flowers.dart';
import 'CardPage.dart';
import 'LikePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Cart _cart; // Создаем экземпляр класса корзины
  late List<FavoriteItem> _favoriteItems = []; // Инициализируем список избранных товаров

  @override
  void initState() {
    super.initState();
    _cart = Cart(); // Инициализируем экземпляр класса корзины
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Цветочный магазин'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Переход к экрану корзины при нажатии на иконку корзины
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart: _cart),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite), // Добавляем иконку сердечка
            onPressed: () {
              // Переход к экрану избранного при нажатии на иконку сердечка
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikePage(
                    favorites: _favoriteItems,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
        ),
        itemCount: flowersList.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 7,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFlovers(
                    name: flowersList[index].name,
                    price: flowersList[index].price,
                    description: flowersList[index].description,
                    specifications: flowersList[index].specifications,
                    fimage: fimageList[index].fimage,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  flowersList[index].image,
                  height: 90,
                  width: 90,
                ),
                const SizedBox(height: 5),
                Text(
                  flowersList[index].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  flowersList[index].price,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Добавление товара в избранное при нажатии на иконку сердечка
                        setState(() {
                          _favoriteItems.add(FavoriteItem(
                            name: flowersList[index].name,
                            price: flowersList[index].price,
                            image: flowersList[index].image,
                          ));
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Товар добавлен в избранное'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Добавление товара в корзину при нажатии на иконку корзины
                        _cart.addItem(CartItem(
                          name: flowersList[index].name,
                          price: flowersList[index].price,
                          image: flowersList[index].image,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Товар добавлен в корзину'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
