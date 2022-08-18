import 'dart:convert';
import 'package:business_deals/model/onetendermodel.dart';
import 'package:business_deals/modules/tenders_details/tenders_details.dart';
import 'package:flutter/material.dart';
import 'package:business_deals/classes/tendersclass.dart';
import 'dart:io';
import 'package:business_deals/model/tendermodel.dart';
import 'package:business_deals/services/api_service.dart';
import 'package:business_deals/modules/tenders_details/tenders_details.dart';
class mydeals extends StatefulWidget {
  const mydeals({Key? key}) : super(key: key);
  static const String routeName = '/tenders-list';

  @override
  State<mydeals> createState() => _mydealsState();
}

class _mydealsState extends State<mydeals> {
  late List<Tendersmodel>? _tendersmodel = [];
  late List<Onetendermodel>? _onetendermodel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _tendersmodel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal[400],
        title: Text(
          "مناقصاتي",
          style: TextStyle(),
        ),
        centerTitle: true,
        elevation: 2.0,
        bottom: PreferredSize(
          preferredSize: Size(30, 30),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(0),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'اشتركت',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  VerticalDivider(
                    width: 5,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'تم',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
      body:
      ListView.builder(
        itemCount: _tendersmodel?.length ?? 0,
        itemBuilder: (context,index){
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(TendersDetails.routeName,arguments: jsonEncode(_tendersmodel?[index]));
                      print(jsonEncode(_tendersmodel?[index]));
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'المحافظة:',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      _tendersmodel?[index]?.address ?? "",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // TextButton.icon(
                                    //     onPressed: (){
                                    //       //print arguments passed to TenderDetails
                                    //       Navigator.push(
                                    //           context, MaterialPageRoute(
                                    //           builder: (context)=>TendersDetails(),
                                    //           settings: RouteSettings(
                                    //             arguments: _tendersmodel?[index],
                                    //           ),
                                    //       )
                                    //       );
                                    //       //print arguments passed to TenderDetails and print it
                                    //       print(_tendersmodel?[index]);
                                    //     },
                                    //     icon: Icon(
                                    //       Icons.description,
                                    //       color: Colors.teal[500],
                                    //       size: 30,
                                    //     ),
                                    //     label: Text(
                                    //         'Details',
                                    //       style: TextStyle(
                                    //           fontSize: 18.0,
                                    //         color: Colors.teal[500],
                                    //         decoration: TextDecoration.underline,
                                    //
                                    //         ),
                                    //     ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _tendersmodel?[index]?.description ?? "",
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'التأمين الابتدائي',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.teal,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          _tendersmodel?[index]?.insuranceMoney ?? "",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  VerticalDivider(
                                    width: 5,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'كراسة الشروط',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.teal,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          _tendersmodel?[index]?.termsOfRefPrice ?? "",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          );

        },
      ),
    );

  }
}
