import 'package:evently/models/user_model.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  UserModel? user;
  Future <void> updateUser(UserModel? user)async {
    this.user=user;
    notifyListeners();

  }



}