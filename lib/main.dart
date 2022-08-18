import 'package:business_deals/modules/account%20info/account_info_screen.dart';
import 'package:business_deals/modules/drawer/Homepage.dart';
import 'package:business_deals/modules/home_tenders/home.dart';
import 'package:business_deals/modules/login/login_screen.dart';
import 'package:business_deals/modules/mydeals/mydeals.dart';
import 'package:business_deals/modules/payment/payment.dart';
import 'package:business_deals/modules/settings/settings_screen.dart';
import 'package:business_deals/modules/signup/signup_screen.dart';
import 'package:business_deals/modules/splash_screen/Intro_screen.dart';
import 'package:business_deals/modules/subsciption/subscribe.dart';
import 'package:business_deals/modules/subscribers/subscribers.dart';
import 'package:business_deals/modules/tenders_details/tenders_details.dart';
import 'package:business_deals/modules/tenders/tenders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:business_deals/classes/sublist.dart';
import 'package:business_deals/classes/tendersclass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:business_deals/services/api_service.dart';
import 'package:business_deals/services/user_service.dart';
import 'package:business_deals/services/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en", "US"),
          Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
          tenders.routeName: (context) => tenders(),
          TendersDetails.routeName: (context) => TendersDetails(),
      },
    );
  }
}
