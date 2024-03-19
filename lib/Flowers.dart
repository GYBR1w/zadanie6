import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';




//Подробная информация о цветах
class DescriptionFlovers extends StatefulWidget {
  final String name;
  final String price;
  final String description;
  final String specifications;
  //final String video;
  final List<String> fimage;

  const DescriptionFlovers({
    Key? key,
    required this.name,
    required this.price,
    required this.description,
    required this.specifications,
    //required this.video,
    required this.fimage,
  }) : super(key: key);

  @override
  _DescriptionFloversState createState() => _DescriptionFloversState();
}

class _DescriptionFloversState extends State<DescriptionFlovers> {
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    //YoutubePlayerController controller = YoutubePlayerController(
    //initialVideoId: widget.video,
    //flags: const YoutubePlayerFlags(
    //autoPlay: false,
    //));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240
      ),
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 300,
                autoPlay: true,

                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemCount: widget.fimage.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image.network(widget.fimage[index]),
                );
              },
            ),
            const SizedBox(height: 30),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,

              count: widget.fimage.length,
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25
                  ),
                  color: const Color.fromARGB(255, 230, 230, 230,
                  ),
                ),
                padding: const EdgeInsets.only(left: 20, right: 20
                ),
                height: 170,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name, //Название товара
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 15
                    ),
                    Text(
                      widget.price, //Цена товара
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25
            ),
            Center(
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25
                  ),
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
                padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                ),
                height: 200, //высота
                width: 400, //ширина
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 17),
                      const Text(
                        "Описание:",
                        style:  TextStyle(fontSize: 23,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color:Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20
                      ),
                      Text(
                        widget.description, //Описание Товара
                        style: const TextStyle(fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25
                  ),
                  color: const Color.fromARGB(255, 230, 230, 230
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                ),
                height: 670, //высота
                width: 400, //ширина
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Состав:",
                      style: TextStyle(fontSize: 23,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color:Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20
                    ),
                    Text(
                      widget.specifications, //Характеристики товара
                      style: const TextStyle(fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25
            ),
            const SizedBox(height: 25
            ),
          ],
        ),
      ),
    );
  }
}