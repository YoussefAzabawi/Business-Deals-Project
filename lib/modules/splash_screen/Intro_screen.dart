import 'package:business_deals/modules/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,
              vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* SizedBox(),*/
              Image.asset('assets/images/1.jpg',
                height: 300,),
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        // bottomLeft: Radius.circular(50),
                        // bottomRight: Radius.circular(50),

                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/white.jpg',
                          height: 100,),
                        // SizedBox(height: 60,),

                        Text('BusinessDeals',style: TextStyle(
                          color: Colors.indigo[700],fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                        ),),
                        SizedBox(height: 30,),
                        Text('Fatest place to buy,and sell raw material ',style: TextStyle(
                            color: Colors.white,fontSize: 25.0,
                            fontWeight: FontWeight.w400
                        ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          height: 50.0,
                          width: 300.0,
                          child: RaisedButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                          },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            color: Colors.white,
                            child: Text('GetStarted',
                              style: TextStyle(
                                  color: Colors.orange[400]
                                  ,fontSize:20
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              /*  SizedBox(
                height: 40.0,
                width: double.infinity,
                child: RaisedButton(onPressed: (){

                  Navigator.of(context).pushNamed('login');
                },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  color: Colors.orange[400],
                child: Text('GetStarted',
                style: TextStyle(
                  color: Colors.white
                      ,fontSize:20
                ),),),
              ),*/
            ],
          ),
        ),
      ),
    );

  }
}
