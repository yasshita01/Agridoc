import 'dart:developer';

import 'package:agridoc/repository/services/api_request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localization/colored_print/print_color.dart';

class UserRepository {
  Future signUp(String username, String email, String password) async {
    // await Future.delayed(Duration(seconds: 3));
    // print("username : $username, phone: $phone, password: $password");

    try {
      var response = await ApiBaseHelper().post('user/register',
          {"name": username, "email": email, "password": password});
      log(response.toString());
      log(response['token']);
      persistToken(response['token']);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future login(String email, String password) async {
    // await Future.delayed(Duration(seconds: 3));
    // if (phone == 'parbat@gmail.com' && password == '12345678') {
    //   return true;
    // }
    try {
      var response = await ApiBaseHelper()
          .post('user/login', {"email": email, "password": password});
      log(response['token']);
      persistToken(response['token']);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future persistToken(String token) async {
    GetStorage box = GetStorage();
    box.write('token', token);
  }

  Future deleteToken() async {
    GetStorage box = GetStorage();
    box.remove('token');
  }

  Future hasToken() async {
    GetStorage box = GetStorage();
    if (box.read('token') != null) {
      return true;
    }
    return false;
  }

  Future getToken() async {
    GetStorage box = GetStorage();
    return box.read('token');
  }
}
