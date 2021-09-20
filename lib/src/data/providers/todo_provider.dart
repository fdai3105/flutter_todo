import 'package:dio/dio.dart';

import '../../utils/share_pref.dart';
import '../connect_service.dart';
import '../models/network_response.dart';
import '../models/todo.dart';

class TodoProvider extends ConnectService {
  static const String url = 'todo';
  static const todayTasksURL = '$url/today-tasks';
  static const findByCategoryURL = '$url/find-by-category';
  static const changeCompleteURL = '$url/change-complete';

  Future<NetworkResponse<Todo>> getTodayTasks() async {
    try {
      final response = await get(
        todayTasksURL,
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
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'
        }),
      );
      return NetworkResponse.fromResponse(response, (value) => Map.from(value));
    } on DioError catch (e, s) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }

  Future<NetworkResponse<Todo>> getTodosByCategory(int id) async {
    try {
      final response = await get(
        findByCategoryURL,
        queryParameters: {'id': id},
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'
        }),
      );
      print(response.data);
      return NetworkResponse.fromResponse(
        response,
        (value) => Todo.fromJson(value),
      );
    } on DioError catch (e) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }

  Future<NetworkResponse> changeComplete({
    required int id,
    required bool value,
  }) async {
    try {
      final response = await post(
        changeCompleteURL,
        data: {'id': id, 'complete': value},
        options: Options(headers: {
          'Authorization': 'Bearer ${SharePref.getUser()!.accessToken}'
        }),
      );
      print(response.data);
      return NetworkResponse.fromResponse(
        response,
        (value) => value,
      );
    } on DioError catch (e) {
      print(e.error);
      print(e.response?.data);
      return NetworkResponse.withError(e.response);
    }
  }
}
