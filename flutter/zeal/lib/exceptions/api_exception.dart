class ApiException implements Exception {
  final code;
  final message;

  ApiException([this.message, this.code]);

  String toString() {
    if (message == null) return "ApiException";
    return "$message";
  }

  int toCode() {
    if (code == null) return 0;
    return code;
  }
}
