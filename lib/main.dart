import 'package:design_cheatsheet/helper/navigator.dart';
import 'package:design_cheatsheet/page/carousel.dart';
import 'package:design_cheatsheet/page/dialog.dart';
import 'package:design_cheatsheet/page/dropdown.dart';
import 'package:design_cheatsheet/page/pageview.dart';
import 'package:design_cheatsheet/page/pdf_viewer.dart';
import 'package:design_cheatsheet/page/sliverappbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Design Cheatsheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SilverAppPage(),
    );
  }
}
