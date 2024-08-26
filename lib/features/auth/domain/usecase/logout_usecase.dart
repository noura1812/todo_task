import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/base/usecase/base_usecase.dart';
import '../repository/auth_repository.dart';

@Injectable()
class LogOutUseCase extends BaseUseCaseNoParams<AsyncValue<void>> {
  final AuthRepository _authRepository;

  LogOutUseCase(this._authRepository);

  @override
  Future<AsyncValue<void>> call() async {
    return _authRepository.signOut();
  }
}
