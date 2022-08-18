/*import 'dart:html';*/
import 'dart:convert';
import 'dart:io';
import 'package:business_deals/modules/home_tenders/home.dart';
import 'package:business_deals/modules/tenders/tenders.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

import '../drawer/Homepage.dart';

Future<Album> createAlbum(
  String title,
  String description,
  String phone,
  String address,
  String insuranceMoney,
  String termsOfRefPrice,
  String tenderer,
  String pdfTender,
) async {
  print(title);
  print(description);
  print(phone);
  print(address);
  print(insuranceMoney);
  print(termsOfRefPrice);
  print(tenderer);
  print(pdfTender);
  final response =
      await http.post(Uri.parse('http://10.0.2.2:8000/tender/'), body: {
    "title": title,
    'description': description,
    "phone": phone.toString(),
    "address": address,
    "insurance_money": insuranceMoney.toString(),
    "terms_of_ref_price": termsOfRefPrice.toString(),
    "tenderer": '1',
    "pdf_tender": pdfTender,
  });
  print('loading');
  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    print('success');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.

    throw Exception('Failed to create album.');
  }
}

class Album {
  final String title;
  final String description;
  final String phone;
  final String address;
  final String insuranceMoney;
  final String termsOfRefPrice;
  final int tenderer;
  final String pdfTender;
  const Album({
    required this.title,
    required this.description,
    required this.phone,
    required this.address,
    required this.insuranceMoney,
    required this.termsOfRefPrice,
    required this.tenderer,
    required this.pdfTender,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      description: json['description'],
      phone: json['phone'],
      address: json['address'],
      insuranceMoney: json['insurance_money'],
      termsOfRefPrice: json['terms_of_ref_price'],
      tenderer: json['tenderer'],
      pdfTender: json['pdf_tender'].toString(),
    );
  }
}

class PostDoc extends StatefulWidget {
  const PostDoc({Key? key}) : super(key: key);
  @override
  _PostDocState createState() {
    return _PostDocState();
  }
}

class _PostDocState extends State<PostDoc> {
  List<PlatformFile>? _files2;

  void _uploadFile1(
  {
    required String title,
    required String description,
    required String phone,
    required String address,
    required String insuranceMoney,
    required String termsOfRefPrice,
    required String tenderer,
}
  ) async {
    var uri = Uri.parse('http://10.0.2.2:8000/tender/');
    var request = new http.MultipartRequest("POST", uri);
    final fileName2 = _files2!.first.path.toString();
    print('file name is  ' + fileName2);
    final file2 = await File(fileName2);
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['phone'] = phone.toString();
    request.fields['address'] = address;
    request.fields['insurance_money'] = insuranceMoney.toString();
    request.fields['terms_of_ref_price'] = termsOfRefPrice.toString();
    request.fields['tenderer'] = '1';
    request.files
        .add(await http.MultipartFile.fromPath('pdf_tender', file2.path));
    /*request.files.add(await http.MultipartFile.fromPath(
         'id',
        '11111'
     ));*/
    await request.send().then((response) async {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    }).catchError((e) {
      print(e);
    });


  }

  void _openFileExplorer1() async {
    _files2 = (await FilePicker.platform.pickFiles(
            type: FileType.any, allowMultiple: false, allowedExtensions: null))!
        .files;
    print('Loaded file path is : ${_files2!.first.path}');
  }

  final formkey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController insuranceMoney = TextEditingController();
  final TextEditingController termsOfRefPrice = TextEditingController();
  final TextEditingController tenderer = TextEditingController();
  final TextEditingController pdftender = TextEditingController();

  Future<Album>? _futureAlbum;

  /*String fileType = 'All';
  var fileTypeList = [
    'All',
    'Image',
    'Video',
    'Audio', /*'MultipleFile'*/
  ];
  FilePickerResult? result;
  PlatformFile? file;
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          leading: BackButton(),
          title: Center(
            child: Text(
              'عمل المناقصه',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: buildColumn(),
            // child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
          ),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'عنوان المناقصه',
                    labelText: 'عنوان المناقصه',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        )),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: description,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'الوصف',
                    labelText: 'الوصف',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        )),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                /*TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'المعلن',
                    labelText: 'المعلن',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),

                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),*/
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: address,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'العنوان',
                    labelText: 'العنوان',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: phone,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'الهاتف',
                    labelText: 'الهاتف',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(width: 3),
                    Expanded(
                      child: TextFormField(
                        controller: termsOfRefPrice,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'سعركراسه الشروط ',
                          labelText: 'سعركراسه الشروط',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: TextFormField(
                        controller: insuranceMoney,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'التامين الابتدائي',
                          labelText: 'التامين الابتدائي',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'كراسه الشروط',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _openFileExplorer1,
                              child: Text('Open File'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange),
                            ),

                            /*ElevatedButton(

                              onPressed: (_uploadFile),

                              child: Text('Upload File'),
                              style: ElevatedButton.styleFrom(primary: Colors.orange),
                            ),*/
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 350,
                  child: RaisedButton(

                    onPressed: () {
                      popuponpress(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const Homepage()),
                      // );
                      _uploadFile1(
                        title:title.text,
                        description: description.text,
                        phone:phone.text,
                        address:address.text,
                        insuranceMoney:insuranceMoney.text,
                        termsOfRefPrice:termsOfRefPrice.text,
                        tenderer:tenderer.text,

                      );
                      if (formkey.currentState!.validate()) {
                        return;
                      }
                    },

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.orange[300],
                    child: Text(
                      'نشر',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),

                ),
                RaisedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                    },

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.orange[300],
                  child: Text(
                    'الى الصفحة الرئيسية',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),


              ],
            ),
          ),
        ),
      ],
    );
  }
  void popuponpress(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Tender was placed successully"),
      content: Text("Thank you"),
    );

    showDialog(
        context: context,

        builder: (BuildContext context) => alertDialog);
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  /*Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'File Name: ${file.name}',
          ),
          Text(
            'File Size: $size',
          ),
          Text(
            'File Extension: ${file.extension}',
          ),
          /*Text('File Path: ${file.path}'),*/
        ],
      ),
    );
  }

  void pickFiles(String? filetype) async {
    switch (filetype) {
      case 'Image':
        result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'Video':
        result = await FilePicker.platform.pickFiles(type: FileType.video);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;

      case 'Audio':
        result = await FilePicker.platform.pickFiles(type: FileType.audio);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'All':
        result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
    }
  }*/

  // multiple file selected
  // navigate user to 2nd screen to show selected files
  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FileListState(files: files, onOpenedFile: viewFile),
    ));
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

FileListState(
    {required List<PlatformFile> files,
    required void Function(PlatformFile file) onOpenedFile}) {}
