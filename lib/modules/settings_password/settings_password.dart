import 'package:business_deals/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  // Initially password is obscure
  bool _obscureText = true;


  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Current Password',
                            suffixIcon: TextButton(
                              onPressed: _toggle,
                              child: Icon(
                                Icons.remove_red_eye,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            suffixIcon: TextButton(
                              onPressed: _toggle,
                              child: Icon(
                                Icons.remove_red_eye,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Confirm New Password',
                            suffixIcon: TextButton(
                              onPressed: _toggle,
                              child: Icon(
                                Icons.remove_red_eye,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
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
                            child: Text("Save"),
                          ),
                        )

                      ],
                    ),
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
