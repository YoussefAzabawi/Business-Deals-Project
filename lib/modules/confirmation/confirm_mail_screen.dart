import 'package:business_deals/modules/drawer/Homepage.dart';
import 'package:business_deals/modules/home_tenders/home.dart';
import 'package:flutter/material.dart';

class ConfirmationMailScreen extends StatelessWidget {
  const ConfirmationMailScreen({Key? key}) : super(key: key);

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
            SizedBox(
              height: 15.0,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirmation Code',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '_ _ _ _ _ _',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homepage(),
                          ),
                        );

                      },
                      elevation: 10,
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
