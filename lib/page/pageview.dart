import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 650,
            child: MyEndlessPageView(images: [
              'https://avatars.githubusercontent.com/u/17571970',
              'https://avatars.githubusercontent.com/u/17571970',
              'https://avatars.githubusercontent.com/u/17571970',
            ]),
          ),
        ],
      ),
    );
  }
}


class MyEndlessPageView extends StatefulWidget {
  final List<String> images;
  MyEndlessPageView({required this.images});

  @override
  _MyEndlessPageViewState createState() => _MyEndlessPageViewState();
}

class _MyEndlessPageViewState extends State<MyEndlessPageView> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.8
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.images.length * 10000,
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index % widget.images.length;
        });
      },
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedPadding(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.all(index % widget.images.length == _currentIndex ? 5 : 25),
              child: Container(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: double.infinity,
                  height: index % widget.images.length == _currentIndex ? 150 : 100,
                  color: Colors.black12,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 200),
                      style: TextStyle(fontSize: index % widget.images.length == _currentIndex ? 25 : 15, color: Colors.blueAccent),
                      child: Text("ChatGPT")
                    ),
                  ),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}