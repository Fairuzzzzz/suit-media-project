import 'package:dio/dio.dart';
import 'package:suit_media_project/modules/third_screen/models/third_screen_models.dart';

class ThirdScreenServices {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://reqres.in/api';

  Future<UserResponse> getUsers({int page = 1, int perPage = 10}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/users',
        queryParameters: {'page': page, 'per_page': perPage},
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
