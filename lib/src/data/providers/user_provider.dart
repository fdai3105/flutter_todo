import 'package:dio/dio.dart';

import '../connect_service.dart';
import '../models/network_response.dart';
import '../models/register.dart';
import '../models/user.dart';

class UserProvider extends ConnectService {
  static const String loginURL = 'auth/login';
  static const String registerURL = 'register';

  Future<NetworkResponse<User>> login(Map map) async {
    try {
      final response = await post(loginURL, data: map);
      return NetworkResponse.fromResponse(
        response,
        (json) => User.fromJson(json),
      );
    } on DioError catch (e, s) {
      print(e.error);
      return NetworkResponse.withError(e.response);
    }
  }

  Future<NetworkResponse<Register>> register(Map map) async {
    try {
      final response = await post(registerURL, data: map);
      return NetworkResponse.fromResponse(
        response,
        (json) => Register.fromJson(json),
      );
    } on DioError catch (e, s) {
      print(e.error);
      return NetworkResponse.withError(e.response);
    }
  }
}
