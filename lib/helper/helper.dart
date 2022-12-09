import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
//keys
  static String isUserLoginKey = "LOGINKEYS";
  static String usernameLoginKey = "USERNAMEKEYS";
  static String emailUserLoginKeys = "EMAILUSERKEYS";

  // saving the data in shared prefrences
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(isUserLoginKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameInStatus(String username) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(usernameLoginKey, username);
  }

  static Future<bool> saveEmailStatus(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(emailUserLoginKeys, userEmail);
  }

  // get the data in shared prefrences
  static Future<bool?> getuserLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(isUserLoginKey);
  }
}
