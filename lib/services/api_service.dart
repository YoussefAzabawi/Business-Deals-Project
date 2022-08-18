import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'constants.dart';
import '../model/user_model.dart';
import '../model/tendermodel.dart';

class ApiService {
  Future<List<Tendersmodel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = utf8.decode(response.bodyBytes);
        var data1 = json.decode(data);
        List<Tendersmodel> tendersmodel = tendersmodelFromJson(response.body);
        return tendersmodel;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}