import 'package:breaking_bad_clone/core/constants/strings.dart';
import 'package:dio/dio.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(options);
  }
}
