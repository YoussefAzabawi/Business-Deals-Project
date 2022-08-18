import 'dart:convert';

import 'package:business_deals/modules/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../modules/userrepo/user_repository.dart';
import '../drawer/Homepage.dart';

//api call start

Future<Album> createAlbum(
  String username,
  String password,
) async {
  print(username);
  print(password);

  final response =
      await http.post(Uri.parse('http://10.0.2.2:8000/api-token-auth/'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "username": username,
            "password": password,
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

  const Album({
    required this.username,
    required this.password,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      username: json['username'],
      password: json['password'],
    );
  }
}

class LoginResopnse {
  String? token;

  LoginResopnse({this.token});

  LoginResopnse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}

//api call end
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  Future<void> loginFunction(
    String username,
    String password,
  ) async {
    print(username);
    print(password);
    print('loading');
    final response =
        await http.post(Uri.parse('http://10.24.160.244:8000/api-token-auth/'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: json.encode({
              "username": username,
              "password": password,
            }));

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      print(response.body[5]);

    var response2 = LoginResopnse.fromJson(jsonDecode(response.body));
      UserRepository.saveUserToken(token: response2.token.toString());
      print(await UserRepository.getUserToken());
      print('success');
    }

    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      print(response.headers);
      print(response.request?.method);
      print(response.body);
    }
  }

  Future<Album>? _futureAlbum;
  // var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 10,
            ),
            Image(
              image: AssetImage('assets/images/bd.png'),
              width: 70,
              height: 70,
            ),
            Center(
                child: Text(
              'Sign-In',
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email cant be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
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
                    obscureText: _obscureText,
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
                        suffixIcon: TextButton(
                          onPressed: _toggle,
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 15.0,
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
                        loginFunction(
                          usernameController.text,
                          passwordController.text,
                        );
                        if(UserRepository.getUserToken() != null){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                        }
                        else{
                          print("false");
                        }
                      },
                      elevation: 10,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));


                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 15,
                        )
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
