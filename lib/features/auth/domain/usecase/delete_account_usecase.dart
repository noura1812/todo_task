import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/base/usecase/base_usecase.dart';
import 'package:todo/features/auth/domain/repository/auth_repository.dart';

@Injectable()
class DeleteAccountUseCase extends BaseUseCaseNoParams<AsyncValue<void>> {
  final AuthRepository _authRepository;

  DeleteAccountUseCase(this._authRepository);

  @override
  Future<AsyncValue<void>> call() async {
    return _authRepository.deleteAccount();
  }
}
