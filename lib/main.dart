import 'package:esptouch_example/tour.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/tour', routes: {
      '/tour': (context) => Tour(),
    });
  }
}
