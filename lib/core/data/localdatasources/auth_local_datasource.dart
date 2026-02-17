import 'package:ticketing_apps/models/responses/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  // Future<void> saveAuthData(LoginResponseModel data) async {
  Future<void> saveAuthData(LoginResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('login_session', data.toJson());
  }

  // Future<LoginResponseModel?> getAuthData() async {
  Future<void> removeAuth() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('login_session');
  }

  // Future<LoginResponseModel?> getAuthData() async {
  Future<LoginResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString('login_session');
    if (data != null) {
      return LoginResponseModel.fromJson(data);
    } else {
      throw Exception('No auth data found');
    }
  }

  // Future<bool> isLoggedIn() async {
  Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey('login_session');
  }
}
