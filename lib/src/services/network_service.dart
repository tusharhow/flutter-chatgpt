import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  Future<Response> post(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _dio.post(
        url,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
