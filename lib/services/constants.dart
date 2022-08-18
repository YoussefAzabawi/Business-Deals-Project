import 'package:business_deals/model/user_model.dart';
import 'package:business_deals/model/tendermodel.dart';
import 'package:business_deals/model/onetendermodel.dart';
import 'package:business_deals/services/api_service.dart';
import 'package:business_deals/services/user_service.dart';
import 'package:business_deals/services/constants.dart';
import 'package:business_deals/modules/tenders/tenders.dart';
import 'package:business_deals/modules/tenders_details/tenders_details.dart';


class ApiConstants {
  static String baseUrl = 'http://10.0.2.2:8000';
  static String usersEndpoint = '/tender/';
  static String userEndpoint = '/tender/';
  static String tendererEndpoint = '/tenderer/';


}