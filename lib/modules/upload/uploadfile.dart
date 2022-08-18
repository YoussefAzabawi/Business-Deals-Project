import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class UploadFile extends StatefulWidget {
  UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  List<PlatformFile>? _files;

  List<PlatformFile>? _files2;

  void _uploadFile() async {
    //TODO replace the url bellow with you ipv4 address in ipconfig
    var uri = Uri.parse('http://10.0.2.2:8000/bid/');
    var request = new http.MultipartRequest("POST", uri);
    final fileName =  _files!.first.path.toString();
    final fileName2 =  _files2!.first.path.toString();
    print('file name is  '+fileName);
    print('file name is  '+fileName2);
    final file =await File(fileName);
    final file2 =await File(fileName2);

    request.files.add(await http.MultipartFile.fromPath(
        'pdf_tech',
        file.path
    ));
    request.files.add(await http.MultipartFile.fromPath(
        'pdf_money',
        file2.path
    ));

    await request.send().then((response) async {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

    }).catchError((e) {
      print(e);
    });
  }

  void _openFileExplorer() async {
    _files = (await FilePicker.platform.pickFiles(
            type: FileType.any, allowMultiple: false, allowedExtensions: null))!
        .files;

    print('Loaded file path is : ${_files!.first.path}');
  }

  void _openFileExplorer2() async {
    _files2 = (await FilePicker.platform.pickFiles(
            type: FileType.any, allowMultiple: false, allowedExtensions: null))!
        .files;

    print('Loaded file path is : ${_files2!.first.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: Text("رفع الملفات")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "الملف الفني",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _openFileExplorer,
                        child: Text('Upload File'),
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                      ),

                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "الملف المالي",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _openFileExplorer2,
                        child: Text('Upload File '),
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,

                children: [
                  ElevatedButton(
                    onPressed: _uploadFile,
                    child: Text('Submit File'),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),

                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
