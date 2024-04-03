import 'package:flutter/material.dart';
import 'Flowers.dart';
import 'modul/DataBase.dart';

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

class LikePage extends StatefulWidget {
  final List<FavoriteItem> favorites;

  LikePage({required this.favorites});

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              widget.favorites[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(widget.favorites[index].name),
            subtitle: Text(widget.favorites[index].price),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  widget.favorites.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Товар удален из избранного.'),
                  duration: Duration(seconds: 1),
                ));
              },
            ),
            onTap: () {
              Flowers flower = flowersList.firstWhere(
                    (flower) => flower.name == widget.favorites[index].name,
                orElse: () => Flowers("", "", "", "", [] as String, ""),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFlovers(
                    name: flower.name,
                    price: flower.price,
                    description: flower.description,
                    specifications: flower.specifications,
                    fimage: [flower.image],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
