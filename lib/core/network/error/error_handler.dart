import 'failure.dart';

enum AuthErrorTypes { defaultError, incorrectPassword, unverified, blocked }

class FirebaseAuthError implements Exception {
  AuthErrorTypes type;
  String code;
  String message;

  FirebaseAuthError(
      {required this.code, required this.message, required this.type});
}

class ErrorHandler implements Exception {
  static Failure handleError(dynamic error) {
    if (error is FirebaseAuthError) {
      return Failure(int.parse(error.code), error.message);
    } else {
      return DefaultFailure();
    }
  }
}

extension GetAuthFailure on AuthErrorTypes {
  Failure getFailure() {
    switch (this) {
      case AuthErrorTypes.incorrectPassword:
        return Failure(1, null);
      case AuthErrorTypes.unverified:
        return Failure(2, null);
      case AuthErrorTypes.blocked:
        return Failure(3, null);
      case AuthErrorTypes.defaultError:
        return Failure(0, null);
    }
  }
}
