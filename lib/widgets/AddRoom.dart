import 'package:esptouch_example/shared/data.dart';
import 'package:esptouch_example/shared/models.dart';
import 'package:esptouch_example/shared/store.dart';
import 'package:esptouch_example/widgets/room_card/room_card.dart';
import 'package:flutter/material.dart';
class AddRoom extends StatefulWidget {
  @override
  _AddRoomState createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  PageController _controller;

  int currentPage = 0;

  List<Room> rooms = AppData.rooms;

  Store _store = Store();

  _onChangePage(int page) {
    setState(() {
      currentPage = page;
    });
    _store.onRoomChange(page);
  }

  @override
  Widget build(BuildContext context) {
    Widget build(BuildContext context) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: PageView.builder(
          controller: _controller,
          itemCount: rooms.length+1,
          physics: BouncingScrollPhysics(),
          onPageChanged: (int page) {
            _onChangePage(page);
          },
          itemBuilder: (BuildContext context, int index) {
            bool isActive = index == currentPage;
            return RoomCard(
                page: index,
                room: rooms[index],
                isActive: isActive
            );
          },
        ),
      );
    }
  }
}
