import 'package:findmyjob/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  UserModel _userModel;

  UserModel get user => _userModel;

  set user(UserModel newUser){
    _userModel = newUser;
    notifyListeners();
  }

}