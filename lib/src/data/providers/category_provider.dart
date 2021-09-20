import 'package:dio/dio.dart';
import 'package:flutter_todo/src/data/models/category.dart';
import 'package:flutter_todo/src/utils/share_pref.dart';

import '../connect_service.dart';
import '../models/network_response.dart';

class CategoryProvider extends ConnectService {
  static const categoryURL = 'category/';

  Future<NetworkResponse<Map>> createCategory(Map map) async {
    try {
      final response = await post(
        categoryURL,
        data: map,
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'
        }),
      );
      return NetworkResponse.fromResponse(response, (value) => value);
    } on DioError catch (e, s) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }

  Future<NetworkResponse<Category>> getCategories() async {
    try {
      final response = await get(
        categoryURL,
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'
        }),
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => Category.fromJson(json),
      );
    } on DioError catch (e, s) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }

  Future<NetworkResponse<Map>> delCategory(int id) async {
    try {
      final response = await delete(
        categoryURL,
        queryParameters: {'id': id},
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'
        }),
      );
      return NetworkResponse.fromResponse(response, (value) => value);
    } on DioError catch (e, s) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }
}
