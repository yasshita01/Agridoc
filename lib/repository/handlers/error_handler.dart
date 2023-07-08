class AppErrors {
  String message, error;

  AppErrors({required this.message, required this.error});

  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends AppErrors {
  FetchDataException(String message)
      : super(message: message, error: "communication error");
}

class BadRequestException extends AppErrors {
  BadRequestException(String message)
      : super(message: message, error: "bad request error");
}

class UnauthorisedException extends AppErrors {
  UnauthorisedException(String message)
      : super(message: message, error: "unauthrised request");
}
