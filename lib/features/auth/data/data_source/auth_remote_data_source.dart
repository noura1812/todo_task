import 'package:injectable/injectable.dart';
import 'package:todo/features/auth/data/data_source/firebase_services_auth.dart';
import '../../domain/model/user.dart';

abstract class AuthRemoteDataSource {
  Future<User?> emailLogin({required String password, required String email});

  Future<User?> getUser();
  Future<void> logout();

  Future<User?> emailRegister(User user);
  Future<void> forgotPassword(String email);

  Future<void> deleteAccount();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseServicesAuth firebaseServicesAuth;
  AuthRemoteDataSourceImpl(this.firebaseServicesAuth);
  @override
  Future<User?> emailRegister(User user) => firebaseServicesAuth.register(user);

  @override
  Future<User?> emailLogin({required String password, required String email}) =>
      firebaseServicesAuth.login(password: password, email: email);

  @override
  Future<void> deleteAccount() => firebaseServicesAuth.deleteAccount();

  @override
  Future<void> logout() => firebaseServicesAuth.logout();

  @override
  Future<void> forgotPassword(String email) =>
      firebaseServicesAuth.forgotPassword(email);

  @override
  Future<User?> getUser() => firebaseServicesAuth.getUser();
}
