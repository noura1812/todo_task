


class Failure {
  final int? responseCode;
  final String? message;
  Failure(this.responseCode,this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(0, '');
}

class CancelFailure extends Failure {
  CancelFailure() : super(0, '');
}

class AuthFailure extends Failure {
  AuthFailure() : super(0, '');
}

class NoInternetFailure extends Failure {
  NoInternetFailure() : super(1, 'noInternetConnection');
}