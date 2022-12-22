import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void push(dynamic halaman){
  navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => halaman)
  );
}

void back(){
  navigatorKey.currentState?.pop();
}

void pushOff(dynamic halaman){
  navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => halaman)
  );
}

void pushOffAll(dynamic halaman){
  navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => halaman
      ), (Route<dynamic> route) => false
  );
}
