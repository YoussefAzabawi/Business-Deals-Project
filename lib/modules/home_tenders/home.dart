import 'package:business_deals/modules/createtender/postdoc.dart';
import 'package:business_deals/modules/tenders/tenders.dart';
import 'package:flutter/material.dart';

import '../createtender/postdoc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Center(
          child: Title(
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    "Business",
                    style: TextStyle(color: Colors.amber),
                  ),
                  Text(
                    "Deals",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20.0),
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/bd.png'),
                width: 70,
                height: 70,
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
                    Text("المناقصات"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber,
                      size: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tenders(),
                    ),
                  );

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
                    Text(" ارشيف المناقصات"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber,
                      size: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                    Text("عمل مناقصة جديدة"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber,
                      size: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {

                },
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
                    Text("مناقصاتي"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
