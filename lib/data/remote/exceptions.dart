class NoUserException implements Exception {
  @override
  String toString() {
    return "Exception: No Logged User";
  }
}

class ServerException implements Exception {
  String message = '';
  int code;

  ServerException.fromJson(this.code, dynamic json) {
    if (json is Map<String, dynamic>) {
      final error = json['error'];
      this.message =
      error is Map<String, dynamic> ? error['message'] : error.toString();
    } else if (json is String) {
      this.message = json;
    }
    this.code = code;
  }

  @override
  String toString() => message;
}
