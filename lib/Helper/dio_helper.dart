import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<Response> get(String path) async {
    return await dio.get(path);
  }
}
