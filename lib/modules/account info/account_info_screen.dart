// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../settings/settings_screen.dart';

class AccountInfoScreen extends StatefulWidget {
  AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  Object _value = 1;
  var dateController = TextEditingController();
  Widget datePicker() {
    return TextField(
      controller: dateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Date",
        suffixIcon: Icon(Icons.date_range),
        hintText: "Date",
      ),
      onTap: () async {
        // open the date picker
        final selectedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
          selectableDayPredicate: (day) => day.isBefore(DateTime.now()),
        );
        if (selectedDate != null) {
          setState(() {
            dateController.text = DateFormat.yMd().format(selectedDate);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Info"),
        backgroundColor: Colors.teal[300],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            datePicker(),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        }),
                    // SizedBox(
                    //   width: 10.0,
                    // ),
                    Text('Male'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Female'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
