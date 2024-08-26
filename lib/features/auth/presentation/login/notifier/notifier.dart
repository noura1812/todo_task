import 'package:todo/core/helpers/dialog_helper.dart';
import 'package:todo/core/network/error/failure.dart';
import 'package:todo/features/auth/domain/model/user.dart';
import 'package:todo/features/auth/domain/repository/auth_repository.dart';
import 'package:todo/features/auth/domain/usecase/delete_account_usecase.dart';
import 'package:todo/features/auth/domain/usecase/logout_usecase.dart';
import 'package:todo/features/auth/domain/usecase/login_usecase.dart';
import 'package:todo/features/auth/domain/usecase/register_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/di.dart';
part 'notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _authRepository = getIt<AuthRepository>();

  late final LoginUseCase _socialLoginUseCase = getIt<LoginUseCase>();

  late final LogOutUseCase _logOutUseCase = getIt<LogOutUseCase>();
  late final DeleteAccountUseCase _deleteAccountUseCase =
      getIt<DeleteAccountUseCase>();
  late final EmailRegisterUseCase _emailRegisterUseCase =
      getIt<EmailRegisterUseCase>();
  @override
  Future<User?> build() async {
    var response = await _authRepository.getUser();
    return response.value;
  }

  Future<void> logIn({required User user}) async {
    state = const AsyncValue.loading();
    DialogHelper.showLoadingDialog();
    var response = await _socialLoginUseCase(user);

    return;
  }

  Future<void> register({required User user}) async {
    state = const AsyncValue.loading();
    DialogHelper.showLoadingDialog();
    var response = await _emailRegisterUseCase(user);
    response.whenOrNull(data: (data) async {
      state = AsyncValue.data(data);
      DialogHelper.dismissDialog();
    }, error: (e, _) {
      return DialogHelper.showErrorDialog(message: (e as Failure).message);
    });

    return;
  }

  Future<void> logOut() async {
    DialogHelper.showLoadingDialog();
    var response = await _logOutUseCase();
    response.whenOrNull(data: (data) {
      state = const AsyncValue.data(null);
      DialogHelper.dismissDialog();
    }, error: (e, _) {
      return DialogHelper.showErrorDialog(message: (e as Failure).message);
    });
    return;
  }

  Future<void> deleteAccount() async {
    DialogHelper.showLoadingDialog();
    var response = await _deleteAccountUseCase();
    response.whenOrNull(data: (data) {
      DialogHelper.dismissDialog();

      state = const AsyncValue.data(null);
    }, error: (e, _) {
      return DialogHelper.showErrorDialog(message: (e as Failure).message);
    });
    return;
  }
}
