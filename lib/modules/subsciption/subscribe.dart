import 'package:business_deals/modules/payment/payment.dart';
import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
    backgroundColor: Colors.teal,
        title: Text(
            'Subscribe',
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'E-mail:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter your E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Subscription Period:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '300 EGP/12 months',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'You will subscribe for 12 months only for 300 EGP and the amount will be deducted from your account. Press the Proceed to payment method button to see all the available methods to pay for your subscription.',
                  style: TextStyle(
                    fontSize: 16.0,
                    //make the text underlined
                    decoration: TextDecoration.underline,

                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Column(
                  children: [
                    Center(
                      child: RaisedButton(
                        onPressed: () {
                          //Navigator push to the payment page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment(),
                            ),
                          );
                        },
                        child: Text(
                          'Proceed to payment method',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        color: Colors.teal,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
