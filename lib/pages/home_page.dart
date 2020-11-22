import 'package:flutter/material.dart';
import 'package:esptouch_example/widgets/home_background.dart';
import 'package:esptouch_example/widgets/home_backdrop_filter.dart';
import 'package:esptouch_example/widgets/rooms_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const HomeBackground(),
            const HomeBackdropFilter(
              child: RoomsList(),
            )
          ],
        ),
      )
    );
  }
}
