import 'package:business_deals/modules/changenum_screen/changenum_sreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
class Factor extends StatefulWidget{
  @override
  State<Factor> createState() => _FactorState();
}
//hello
class _FactorState extends State<Factor> {
  @override
  bool selected=false;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.teal[400],
        leading:BackButton(),
        title: Text("Profile"
          ,textAlign: TextAlign.end,

        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('2-Factor Authentication',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  'Text message',

                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(width: 80,),
                FlutterSwitch(
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey,
                  value: selected,
                  onToggle: (bool value) {
                    setState(() {
                      selected=true;
                    });
                  },

                ),


              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  'Change phone',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 80,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:IconButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNumScreen(),
                      ),
                    );
                  },
                    icon: Icon(Icons.forward,color: Colors.orange[300],
                      size: 30,
                    ),
                  ),
                ),

              ],
            ),
          ],

        ),

      ),

    );
  }
}