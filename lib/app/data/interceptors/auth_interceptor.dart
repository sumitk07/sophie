import 'package:dio/dio.dart';
import 'package:sophie/app/modules/auth/controllers/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authController = AuthController.to;
    if (authController.token.value != null) {
      options.headers['Authorization'] = 'Bearer ${authController.token.value}';
    }
    super.onRequest(options, handler);
  }
}
