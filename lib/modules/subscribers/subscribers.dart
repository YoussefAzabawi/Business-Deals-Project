import 'dart:io';
import 'package:business_deals/modules/login/login_screen.dart';
import 'package:business_deals/modules/settings/settings_screen.dart';
import 'package:business_deals/modules/splash_screen/Intro_screen.dart';
import 'package:business_deals/modules/tenders_details/tenders_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:business_deals/classes/sublist.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
class Subscribers extends StatefulWidget {

  const Subscribers({Key? key}) : super(key: key);

  @override
  State<Subscribers> createState() => _SubscribersState();
}

class _SubscribersState extends State<Subscribers> {

  List<sublist> numbers = [

    sublist(name: "الشركة السعودية", date: "20/12/2019"),
    sublist(name: "الشركة السعودية", date: "24/12/2019"),
    sublist(name: "الشركة البريطانية", date: "30/12/2019"),
    sublist(name: "الشركة الافغانية", date: "12/12/2019"),

  ];
  _launchURL() async {
    const url = 'http://10.24.160.231:3000/pdf_tech/da50666f-8603-446f-b120-1e11f6f777d0_ZVS8xy3.jpg';
    if (await launch(url)) {
      await canLaunch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal[400],
        title: Text(
          "المشاركين",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    numbers[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
                Card(
                  child:Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ":تاريخ ",
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  numbers[index].date,
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      'المالي',
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: (){
                                        _launchURL();
                                      },
                                      icon: Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.red,
                                      ),
                                      label: Text(""),
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                children: [
                                  Text(
                                    'الفني',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: (){},
                                    icon: Icon(
                                        Icons.picture_as_pdf,
                                      color: Colors.red,
                                    ),
                                    label: Text(""),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

        },
      ),
    );
  }
}
