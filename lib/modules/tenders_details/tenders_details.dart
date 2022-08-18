import 'dart:convert';
import 'package:business_deals/modules/settings/settings_screen.dart';
import 'package:business_deals/modules/upload/uploadfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:business_deals/model/tendermodel.dart';
import 'package:business_deals/model/onetendermodel.dart';
import 'package:business_deals/services/api_service.dart';
import 'package:business_deals/modules/tenders/tenders.dart';
import'package:url_launcher/url_launcher.dart';

class TendersDetails extends StatefulWidget {
  const TendersDetails({Key? key}) : super(key: key);
  static const String routeName = '/tenders-details';

  @override
  State<TendersDetails> createState() => _TendersDetailsState();
}

class _TendersDetailsState extends State<TendersDetails> {
  _launchURRRL() async {
    const url = 'https://www.orimi.com/pdf-test.pdf';
    if (await launch(url)) {
      await canLaunch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Tendersmodel? tender;
  late List<Tendersmodel>? _tendersmodel = [];
  late List<Onetendermodel>? _onetendermodel = [];
  //create a list
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _tendersmodel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
//get data from argument from tenders (index) as json and the decode it to use it here
  void didChangeDependencies() {
    var tenderString = ModalRoute.of(context)?.settings.arguments as String;
    var tenderJson = jsonDecode(tenderString);
    super.didChangeDependencies();
    print(tenderJson);
    setState(() {
      tender = Tendersmodel.fromJson(tenderJson);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "التفاصيل"
        ),
        backgroundColor: Colors.teal[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'عنوان المناقصة',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        tender?.title ?? '',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'الوصف',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        tender?.description ?? '',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'المعلن',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        tender?.tenderer.toString() ?? '',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'العنوان',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        tender?.address ?? '',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'الهاتف',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        tender?.phone ?? '',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تاريخ الإنتهاء',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10),)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Text(
                                    tender?.updatedAt?.toString() ?? '',
                                    style: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تاريخ الطرح',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10),)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Text(
                                    tender?.createdAt?.toString() ?? '',

                                    style: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),


                        ],

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'التأمين الإبتدائي',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10),)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Text(
                                    tender?.insuranceMoney ?? '',
                                    style: TextStyle(
                                      fontSize: 19.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'سعر كراسة الشروط',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10),)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Text(
                                    tender?.termsOfRefPrice ?? '',
                                    style: TextStyle(
                                      fontSize: 19.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),


                        ],

                      ),
                    ],
                  ),
                  Text(
                    'الملفات',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        _launchURRRL();

                      },
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text("تحميل"),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadFile(),
                          ),
                        );

                      },
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text("اشترك في المناقصة"),
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
