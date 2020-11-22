import 'package:flutter/material.dart';
import 'package:esptouch_example/widgets/gradient_box.dart';
import 'package:esptouch_example/shared/styles.dart';

class Shutter extends StatelessWidget {
  final bool status;
  final String heading;
  final String subHeading;

  const Shutter({Key key,
    this.status = false,
    this.heading = '',
    this.subHeading = ''
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    double _value = 50;

    return Column(
      children: [
        GradientBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(heading,
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      SizedBox(height: 5.0),
                      Material(
                        color: Colors.transparent,
                        child: Text(subHeading,
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white54)),
                      )
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text('${status ? 'ON' : 'OFF'}',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Center(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                         SizedBox(width: 50.0),

                        Text('up',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white54)),
                        Icon(Icons.arrow_upward_outlined, color: Colors.grey,size: 50,),
                        Text('stop',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white54)),
                        Icon(Icons.pause_outlined, color: Colors.grey,size: 50,),

                        Text('down',
                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white54)),

                        Icon(Icons.arrow_downward_outlined, color: Colors.grey, size:50),

                      ],
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),

      ],
    );
  }
}