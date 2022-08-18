// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'constants.dart';
// import '../model/user_model.dart';
// import '../model/tendermodel.dart';
// import '../model/onetendermodel.dart';
//
// class ApiService {
//   Future<List<Onetendermodel>?> gettenders() async {
//     try {
//       // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndpoint + '$onetendermodelFromJson(int id)');
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<Onetendermodel> onetendermodel = onetendermodelFromJson(response.body);
//         return onetendermodel;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }