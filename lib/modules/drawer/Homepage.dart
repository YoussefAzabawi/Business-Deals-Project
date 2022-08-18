import 'package:business_deals/modules/createtender/postdoc.dart';
import 'package:business_deals/modules/mydeals/mydeals.dart';
import 'package:business_deals/modules/tenders/tenders.dart';

import 'mydrawerlist.dart';
import 'myheaderdrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:business_deals/modules/createtender/postdoc.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          'Homepage'
        ),
      ),

      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 30),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 40, end: 40),
                child: Image(
                  image: AssetImage('assets/images/black.jpg'),
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1, // thickness of the line
                indent: 20, // empty space to the leading edge of divider.
                endIndent:
                20, // empty space to the trailing edge of the divider.
                color: Colors.grey, // The color to use when painting the line.
                height: 10, // The divider's height extent.
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print('object');
                },
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/auction.png'),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => tenders()));
                      },
                      child: Text("المناقصات",
                          style:
                          TextStyle(fontSize: 20, color: Colors.grey[700])),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print('object');
                },
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/archive.png'),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(" ارشيف المناقصات",
                        style:
                        TextStyle(fontSize: 20, color: Colors.grey[700])),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1, // thickness of the line
                indent: 20, // empty space to the leading edge of divider.
                endIndent:
                20, // empty space to the trailing edge of the divider.
                color: Colors.grey, // The color to use when painting the line.
                height: 10, // The divider's height extent.
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CreateTender(),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/add-file.png'),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDoc(),
                          ),
                        );
                      },
                      child: Text("عمل مناقصة جديدة",
                          style:
                          TextStyle(fontSize: 20, color: Colors.grey[700])),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 21),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/busness.png'),
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => mydeals(),
                          ),
                        );
                      },
                      child: Text(
                        "مناقصاتي",
                        style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 98),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.amber,
                          size: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1, // thickness of the line
                indent: 20, // empty space to the leading edge of divider.
                endIndent:
                20, // empty space to the trailing edge of the divider.
                color: Colors.grey, // The color to use when painting the line.
                height: 10, // The divider's height extent.
              ),
            ],
          ),

        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child:Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),

              ],
            ),
          ) ,
        ),
      ),

    );
  }
}
