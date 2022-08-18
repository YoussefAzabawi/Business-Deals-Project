import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {

  static Future<void> saveUserToken({required String token}) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    await sharedPreferences.setString('token', token);
  }
  static Future<void> deleteUserToken() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    await sharedPreferences.remove('token');
  }
  static Future<String?> getUserToken() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    return sharedPreferences.getString('token');
  }

  static Future<void> saveUserID({required String id}) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    await sharedPreferences.setString('id', id);
  }
  static Future<void> deleteUserID() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    await sharedPreferences.remove('id');
  }
  static Future<String?> getUserID() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    return sharedPreferences.getString('id');
  }

  UserRepository();
}