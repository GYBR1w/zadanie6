import 'package:flutter/material.dart';
import 'Flowers.dart';

class FavoriteItem {
  final String name;
  final String price;
  final String image;

  FavoriteItem({
    required this.name,
    required this.price,
    required this.image,
  });
}

class LikePage extends StatelessWidget {
  final List<FavoriteItem> favorites;

  LikePage({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              favorites[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(favorites[index].name),
            subtitle: Text(favorites[index].price),
          );
        },
      ),
    );
  }
}
