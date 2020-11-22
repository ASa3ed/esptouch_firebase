import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:esptouch_example/tour.dart';
import 'esp.dart';
class HomeBackdropFilter extends StatefulWidget {
  final Widget child;

  const HomeBackdropFilter({Key key, @required this.child}):
        assert(child != null),
        super(key: key);

  @override

  _HomeBackdropFilterState createState(){
    return new _HomeBackdropFilterState();
  }
}



class _HomeBackdropFilterState extends State<HomeBackdropFilter> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
            if (_scaffoldKey.currentState.isDrawerOpen) {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Drawer is Open"),
              ));
            } else {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Drawer is Closed"),
              ));
            }
          },
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[

            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/logo/orecatech.jpg'),
                    fit: BoxFit.fill,
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Tour()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('configure'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ESP()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white.withOpacity(0.5),
        child: BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6,
          ),
          child: new Container(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('CHOOSE YOUR ROOM',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black54))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
