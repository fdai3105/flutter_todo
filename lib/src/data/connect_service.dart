import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class ConnectService extends DioForNative {
  ConnectService([BaseOptions? baseOptions]) : super(baseOptions) {
    options.baseUrl = 'http://192.168.1.7:3000/';
    options.contentType = Headers.jsonContentType;
  }
}
