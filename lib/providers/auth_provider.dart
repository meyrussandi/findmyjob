import 'dart:convert';

import 'package:findmyjob/constants/value.dart';
import 'package:findmyjob/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {


  Future<LoginRegisterResult> register(
      String email, String pasword, String name, String goal) async {
    try {
      var body = {
        'email': email,
        'password': pasword,
        'name': name,
        'goal': goal,
      };

      var respone =
          await http.post(Uri.parse(baseUrl + "register"), body: body);

      print("response status : " + respone.statusCode.toString());
      print("response body : " + respone.body);

      if(respone.statusCode == 200){
        print("masuk");
        UserModel userModel = UserModel.fromJson(jsonDecode(respone.body));
        return LoginRegisterResult(userModel: userModel);
      }else{
        print("masuk else");
        return LoginRegisterResult(message: respone.body.split('"')[3]);
      }
    } catch (e) {
      print(e);
      return LoginRegisterResult(message: e.toString());
    }
  }
}


class LoginRegisterResult{
  final UserModel userModel;
  final String message;

  LoginRegisterResult({this.userModel, this.message});
}
