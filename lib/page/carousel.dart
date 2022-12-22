import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int currentIndexItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeaeae0),
      appBar: AppBar(),
      body: Column(
        children: [

          CarouselSlider(
            options: CarouselOptions(
                height: 350,
                viewportFraction: 0.7,
                onPageChanged: (index, reason) {
                  setState(() => currentIndexItem = index);
                }
            ),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CardItem(i, currentIndexItem + 1 == i ? true : false);
                },
              );
            }).toList(),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MiniCircle(currentIndexItem == 0 ? true : false),
              MiniCircle(currentIndexItem == 1 ? true : false),
              MiniCircle(currentIndexItem == 2 ? true : false),
              MiniCircle(currentIndexItem == 3 ? true : false),
              MiniCircle(currentIndexItem == 4 ? true : false),
            ],
          )

        ],
      ),
    );
  }

  Widget MiniCircle(bool active){
    Color color  = Colors.grey.withOpacity(0.5);
    double width = 15;

    if(active) {
      color = Colors.teal.withOpacity(0.75);
      width = 25;
    }

    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: width,
      height: 15,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
      ),
      duration: const Duration(milliseconds: 200),
    );
  }

  Widget CardItem(int index, bool active){
    double width = 215;
    double height = 215;
    if(active) width = height = 280;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
            height: height,
            width: width,
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
            ),
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Text('Card $index')
        ),
      ],
    );
  }
}
