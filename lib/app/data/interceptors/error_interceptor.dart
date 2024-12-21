import 'package:dio/dio.dart';
import 'package:sophie/app/shared/snackbar.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    String errorTitle = "Error";
    String errorMessage = "An unexpected error occurred";

    if (err.type == DioExceptionType.connectionTimeout) {
      errorMessage = "Connection Timeout";
    }

    if (err.response != null) {
      switch (err.response!.statusCode) {
        case 400:
          errorTitle = "Bad Request";
          errorMessage = '${err.response?.data['message']}';
          break;
        case 401:
          errorTitle = "Unauthorized";
          errorMessage = '${err.response?.data['message']}';
          break;
        case 403:
          errorTitle = "Forbidden";
          errorMessage = '${err.response?.data['message']}';
          break;
        case 404:
          errorTitle = "Not Found";
          // errorMessage = '${err.response?.data['message']}';
          errorMessage = "";
          break;
        case 500:
          errorTitle = "Server Error";
          errorMessage = 'Internal Server Error';
          break;
        default:
          errorTitle = "Error";
          errorMessage = '${err.response?.statusMessage}';
          break;
      }
    }

    CustomSnackbar.error("$errorTitle: $errorMessage");
    handler.next(err);
  }
}
