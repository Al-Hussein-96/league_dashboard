import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/utils/constants.dart';
import 'package:league_dashboard/screen/login/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<LoginModel> getLastToken();

  Future<void> cacheToken(LoginModel loginModel);
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheToken(LoginModel loginModel) {
    return sharedPreferences.setString(CACHED_TOKEN, jsonEncode(loginModel));
  }

  @override
  Future<LoginModel> getLastToken() {
    String jsonStr = "";
    print('getLastToken');
    try {
      String jsonStr = sharedPreferences.getString(CACHED_TOKEN)!;
      print('getLastToken: ' + jsonStr);

    } catch (e) {
      print(e);
    print('error exception');
      throw CacheException();

    }

    if (jsonStr == null) {
      throw CacheException();
    }
    return Future.value(LoginModel.fromJson(jsonDecode(jsonStr)));
  }
}
