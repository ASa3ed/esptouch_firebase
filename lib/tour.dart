import 'package:flutter/material.dart';
import 'package:esptouch_example/theme.dart';
import 'package:esptouch_example/routes.dart';

class Tour extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      onGenerateRoute: Routes.builder(),
    );
  }
}