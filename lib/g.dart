import 'package:flutter/material.dart';
class lll extends StatefulWidget {
  @override
  _lllState createState() => _lllState();
}

class _lllState extends State<lll> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
