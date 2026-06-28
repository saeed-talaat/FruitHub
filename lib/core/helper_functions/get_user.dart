import 'dart:convert';

import 'package:fruits_ecommerce_app/Features/auth/data/models/user_model.dart';
import 'package:fruits_ecommerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_ecommerce_app/constant.dart';
import 'package:fruits_ecommerce_app/core/services/shared_preferences_singletone.dart';

UserEntity? getUser() {
  var jsonString = Prefs.getString(kUserData);

  if ( jsonString.isEmpty) {
    return null; 
  }

  var userEntity = UserModel.fromJson(jsonDecode(jsonString)); 
  
  return userEntity;
}