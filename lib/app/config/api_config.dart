class AppUrl {
  AppUrl._();

  // api base url
  static const String baseUrl =
      "http://ec2-3-87-73-198.compute-1.amazonaws.com/v1";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(seconds: 60);

  // connectTimeout
  static const Duration connectionTimeout = Duration(seconds: 60);

  static const String auth = '/auth';
}
