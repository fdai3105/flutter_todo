import 'package:dio/dio.dart';

import '../../utils/share_pref.dart';
import '../connect_service.dart';
import '../models/network_response.dart';
import '../models/todo.dart';

class TodoProvider extends ConnectService {
  static const String url = 'todo';

  Future<NetworkResponse<Todo>> getTodos() async {
    try {
      final response = await get(
        url,
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}',
        }),
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => Todo.fromJson(json),
      );
    } on DioError catch (e, s) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }

  Future<NetworkResponse<Map>> createTodo(Map param) async {
    try {
      final response = await post(
        url,
        data: param,
        options: Options(
            headers: {'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'}),
      );
      return NetworkResponse.fromResponse(response, (value) => Map.from(value));
    } on DioError catch (e, s) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }
}
