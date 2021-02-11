import 'package:esptouch_example/shared/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//kont btn2l dh mn data.dart ele f stickynotes2 bs lesa btfkr tshyl l id w tshofho 3amla fl stickynotes2 ezay

class Data {
  static final Data _data = Data._internal();
  factory Data.getInstance() => _data;
  Data._internal();

  List<Room> rooms = new List();
  List<String> arrangement = new List();

  Future init() async {
    await _fetchNotes();
  }

  Future _fetchNotes() async {
    final sp = await SharedPreferences.getInstance();

    String arrange = sp.getString("arrangement");

    if (arrange == null || arrange == "") return;

    for (String idString in arrange.split(",")) {
      arrangement.add(idString);
    }

    String tempId = "0";

    while (true) {
      String temp = sp.getString(tempId);
      if (temp == null) break;

      var almostNote = temp.split("^~#");
      int almostnum =0;


      rooms.add(new Room(
        id: almostnum,
        name: almostNote[0],
        image: almostNote[1],
        devicesCount: almostnum,

      ));

      tempId = (int.parse(tempId) + 1).toString();
    }
  }

  Future updateNotes() async {
    final sp = await SharedPreferences.getInstance();

    _updateArrangement();

    for (Room room in rooms) {
      String temp = "";
      //temp += room.id ;
      temp += room.name + "^~#";
      temp += room.image + "^~#";


      sp.setString(rooms.indexOf(room).toString(), temp);
    }
  }

  Room getNote(int id) => this.rooms[id];

  Future _updateArrangement() async {
    final sp = await SharedPreferences.getInstance();

    String arrange = "";
    for (String a in arrangement) {
      arrange += a + ",";
    }
    if (arrange != "") arrange = arrange.substring(0, arrange.length - 1);
    sp.setString("arrangement", arrange);
  }

  Future addOrModifyRoom(
      {@required bool add,
        int id,
        String name,
        String image,
        int devicesCount}) async {
    if (add) {
      this.rooms.add(new Room(
        id: id??"",
        name: name??"",
        image: image,
        devicesCount: devicesCount,
      ));
      arrangement.insert(0, (rooms.length - 1).toString());
      _updateArrangement();
    } else {
      this.rooms[id] = Room(
        id: id??"",
        name: name??"",
        image: image,
        devicesCount: devicesCount,
      );
    }
  }

  void deleteNotes(int id) async {
    final sp = await SharedPreferences.getInstance();

    arrangement.remove(id.toString());
    _updateArrangement();

    sp.remove(id.toString());
  }

  void moveNotes(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;

    var temp = arrangement.removeAt(oldIndex);
    arrangement.insert(newIndex, temp);

    _updateArrangement();
  }
}
class AppData {

  static     List<Room> rooms = [

    Room(id: 1, name: 'Living Room', image: 'assets/images/living_room.jpg', devicesCount: 5),
    Room(id: 2, name: 'Bedroom', image: 'assets/images/bedroom.jpg', devicesCount: 3),
    Room(id: 3, name: 'Kitchen', image: 'assets/images/kitchen.jpg', devicesCount: 4),
    Room(id: 4, name: 'Bathroom', image: 'assets/images/bathroom.jpg', devicesCount: 2),
  ];

}