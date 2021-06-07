import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:league_dashboard/core/error/error.dart';
import 'package:league_dashboard/core/error/failures.dart';
import 'package:league_dashboard/core/network/rest_client_service.dart';
import 'package:league_dashboard/screen/login/data/models/login_model.dart';
import 'package:league_dashboard/screen/login/domain/entities/login.dart';
import 'package:league_dashboard/core/models/response_api.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> loginUser(String email, String password);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final RestClientService restClientService;

  LoginRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<LoginModel> loginUser(String username, String password) async {
    print("username: " + username + " : " + password);
    // return LoginModel(token: "123456");

    final response = await restClientService.loginUser(jsonEncode({
      'username': username,
      'password': password,
    }));
    print('after await');
    print('response.statusCode: ' + response.body);
    if (response.statusCode != 200) {
      throw ServerException();
    }

    ResponseApi api = ResponseApi.fromJson(jsonDecode(response.body));
    print('api: ' + api.message);

    if(!api.success){
      print('throw error');
      throw DataException();
    }

    return LoginModel.fromJson(jsonDecode(response.body));
  }
}
