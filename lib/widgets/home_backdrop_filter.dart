import 'dart:ui' as ui;
import 'package:esptouch_example/tour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../esp.dart';

class HomeBackdropFilter extends StatelessWidget {
  final Widget child;

  const HomeBackdropFilter({Key key, @required this.child}):
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                SafeArea(child:
            SizedBox(
                  height: 20,
                  width: 50,
                  child: RaisedButton(
                    color: Colors.brown,
                        child: Icon(
                          Icons.add
                        ),
                  ),
                ),
                ),
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
                child
              ],
            ),
          ),
        ),
      ),
    );

  }
}