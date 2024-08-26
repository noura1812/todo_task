import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../model/user.dart';
import '../repository/auth_repository.dart';

@Injectable()
class LoginUseCase extends BaseUseCase<AsyncValue<User?>, User> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<AsyncValue<User?>> call(User params) async {
    return await _authRepository.login(
        email: params.email!, password: params.password!);
  }
}
