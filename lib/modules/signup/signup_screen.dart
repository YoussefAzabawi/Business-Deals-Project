import 'package:business_deals/modules/confirmation/confirm_mail_screen.dart';
import 'package:business_deals/modules/drawer/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//api call start

Future<Album> createAlbum(
    String username,
    String password,
    String email,
    ) async {
  print(username);
  print(password);
  print(email);
  final response =
  await http.post(Uri.parse('http://10.0.2.2:8000/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "username": username,
        "password": password,
        "email": email,
      }));

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    print('success');
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(response.statusCode);
    print(response.headers);
    print(response.request?.method);
    print(response.body);
    // print(response.);
    // print(response.toString());
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String username;
  final String password;
  final String email;

  const Album({
    required this.username,
    required this.password,
    required this.email,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      username: json['username'],
      password: json['password'],
      email: json['email'],
    );
  }
}

//api call end

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  Future<Album>? _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal[400],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/shhk.png'),
              width: double.infinity,
              height: 160,
            ),
            Image(
              image: AssetImage('assets/images/bd.png'),
              width: 70,
              height: 70,
            ),
            Center(
                child: Text(
              'Let\'s get started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            )),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'username',
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.6),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.6),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password cant be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Colors.white.withOpacity(0.6)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white.withOpacity(0.6),
                        )),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.amber,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _futureAlbum =
                              createAlbum(
                                usernameController.text,
                                passwordController.text,
                                emailController.text,
                              );
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Homepage()));
                      },
                      elevation: 10,
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
