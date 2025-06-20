import 'package:flutter/material.dart';
import 'package:testttt/model/my_user.dart';

class AuthUserProvider extends ChangeNotifier{
  MyUser? currentUser;

  void updateUser(MyUser newUser){
    currentUser = newUser;
    notifyListeners();
  }
}