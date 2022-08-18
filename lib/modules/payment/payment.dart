import 'package:business_deals/modules/drawer/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launchUrl;
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  _launchURRL() async {
    const url = 'https://www.paypal.com/eg/home';
    if (await launch(url)) {
      await canLaunch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
            'Payment',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '300 EGP',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'الاجمالي:',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,

                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '12 شهر',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'المدة:',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              ':اختر طريفة الدفع',
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,

              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                Container(
                  child: TextButton.icon(
                    onPressed: () async {
                      _launchURRL();
                    },
                    icon: Image.asset(
                      'assets/images/PayPal.svg.png',
                      height: 75.0,
                      width: 75.0,
                    ),
                    label: Text(
                      'Paypal',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(),
                  onPressed: (){},
                  icon: Image.asset(
                    'assets/images/visa.png',
                    height: 75.0,
                    width: 75.0,
                  ),
                  label: Text(
                    'Visa/Master Card',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextButton.icon(

                  style: TextButton.styleFrom(),
                  onPressed: (){},
                  icon: Image.asset(
                    'assets/images/fawry-en1.png',
                    height: 75.0,
                    width: 75.0,
                  ),
                  label: Text(
                    'Fawry',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                },
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text("تم"),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
