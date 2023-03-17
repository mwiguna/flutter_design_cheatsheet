import 'package:design_cheatsheet/helper/navigator.dart';
import 'package:design_cheatsheet/page/pageview.dart';
import 'package:flutter/material.dart';

class SilverAppPage extends StatefulWidget {
  const SilverAppPage({Key? key}) : super(key: key);

  @override
  State<SilverAppPage> createState() => _SilverAppPageState();
}

class _SilverAppPageState extends State<SilverAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double percent = ((200 - constraints.maxHeight) / constraints.maxHeight).clamp(0.0, 1);

                return GestureDetector(
                  onTap: () => push(PageViewPage()),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/17571970',
                          fit: BoxFit.cover,
                        ),
                      ),
                      
                      Opacity(
                        opacity: percent,
                        child: Container(
                          color: Colors.teal,
                        ),
                      ),

                      Positioned(
                        left: 15,
                        bottom: 15,
                        child: Opacity(
                          opacity: percent,
                          child: Text(
                            "Title",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

              },
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return ListTile(
                  title: Column(
                    children: [
                      Text("OK"),
                    ],
                  ),
                );
              },
              childCount: 15,
            ),
          ),

        ],
      )
    );
  }
}
