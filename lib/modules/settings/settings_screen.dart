import 'dart:ui';
import 'package:business_deals/modules/2factor_Authentication/2factor_Authentication.dart';
import 'package:business_deals/modules/account%20info/account_info_screen.dart';
import 'package:business_deals/modules/settings_email/settings_email.dart';
import 'package:business_deals/modules/settings_password/settings_password.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropdownvalue = 'English';

  var items = [
    'English',
    'Arabic',
  ];

  String dropvalue = 'Egypt';
  var countries = [
    'Egypt',
    'USA',
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "Settings"
        ),
        backgroundColor: Colors.teal[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(     // <-- TextButton
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountInfoScreen(),
                          ),
                        );

                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 24.0,
                        color: Colors.yellow[800],
                      ),
                      label: Text(
                        'Account Info',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    TextButton.icon(     // <-- TextButton
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeEmail(),
                            ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 24.0,
                        color: Colors.yellow[800],
                      ),
                      label: Text(
                        'Change E-mail',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    TextButton.icon(     // <-- TextButton
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 24.0,
                        color: Colors.yellow[800],
                      ),
                      label: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    TextButton.icon(     // <-- TextButton
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Factor(),
                          ),
                        );

                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 24.0,
                        color: Colors.yellow[800],
                      ),
                      label: Text(
                        '2-Factor Authentication',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1.0,
                    ),

                  ],
                ),
              ),
              Text(
                'Language',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton(
                      value: dropdownvalue,
                      icon:  Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                              color: Colors.yellow[800],
                              fontSize: 18.0,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1.0,
                    ),

                  ],
                ),
              ),
              Text(
                'Country',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton(
                      value: dropvalue,
                      icon:  Icon(Icons.keyboard_arrow_down),
                      items: countries.map((String countries) {
                        return DropdownMenuItem(
                          value: countries,
                          child: Text(
                            countries,
                            style: TextStyle(
                              color: Colors.yellow[800],
                              fontSize: 18.0,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          dropvalue = newVal!;
                        });
                      },
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      color: Colors.teal[400],
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
