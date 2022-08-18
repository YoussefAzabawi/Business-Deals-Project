/*import 'dart:js';*/

import 'package:business_deals/modules/drawer/Homepage.dart';
import 'package:business_deals/modules/subsciption/subscribe.dart';
import 'package:business_deals/modules/subscribers/subscribers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../settings/settings_screen.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  get children => null;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 15),
      child:Column(
        children: [
          menuItem(context),
        ],
        //show list of menu order
      ) ,
    );



  }

  Widget menuItem(BuildContext context){
    return Column(
         children: [
           ListTile(
             leading: Icon(Icons.home),
             title: Text('Home'),
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Homepage(),
                 ),
               );
             },
           ),
           ListTile(
             leading: Icon(Icons.settings),
             title: Text('Setting'),
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => SettingsScreen (),
                 ),
               );
             },


           ),
           ListTile(
             leading: Icon(Icons.people),
             title: Text('bidder List'),
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Subscribers(),
                 ),
               );
             },

           ),
           ListTile(
             leading: Icon(Icons.star),
             title: Text('My Deals'),
             onTap: (){
               /*Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Homepage(),
                 ),
               );*/
             },


           ),
           ListTile(
             leading: Icon(Icons.payment),
             title: Text('Subscribe Now'),
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Subscribe(),
                 ),
               );
             },


           ),

         ],

      );
  }
}
enum DrawerSections{
  Home,
  setting,
  bidderList,
}