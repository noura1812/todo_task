import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/base/usecase/base_usecase.dart';
import 'package:todo/features/auth/domain/repository/auth_repository.dart';

@Injectable()
class ForgotPasswordUseCase extends BaseUseCase<AsyncValue<void>, String> {
  final AuthRepository _authRepository;

  ForgotPasswordUseCase(this._authRepository);

  @override
  Future<AsyncValue<void>> call(String params) async {
    return _authRepository.forgotPassword(params);
  }
}
