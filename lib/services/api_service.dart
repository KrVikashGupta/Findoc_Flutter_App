import 'package:dio/dio.dart';
import '../models/image_model.dart';

class ApiService {
  final Dio _dio;
  static const String _baseUrl = 'https://picsum.photos/v2';

  ApiService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<ImageModel>> fetchImages({int? page, int? limit}) async {
    try {
      final response = await _dio.get('$_baseUrl/list', queryParameters: {
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
      });

      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data.map((e) => ImageModel.fromJson(e as Map<String, dynamic>)).toList();
      }
      throw Exception('Failed to load images: ${response.statusCode}');
    } on DioError catch (e) {
      final message = e.response?.data is Map<String, dynamic>
          ? (e.response!.data['message'] ?? e.message)
          : e.message;
      throw Exception('Network error: $message');
    } catch (e) {
      rethrow;
    }
  }
}

