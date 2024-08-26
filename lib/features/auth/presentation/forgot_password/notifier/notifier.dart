import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/app/di.dart';
import 'package:todo/core/network/error/failure.dart';
import 'package:todo/features/auth/domain/usecase/forgot_password_usecase.dart';
import '../../../../../core/helpers/dialog_helper.dart';

part 'notifier.g.dart';

@riverpod
class ForgetPasswordNotifier extends _$ForgetPasswordNotifier {
  late final ForgotPasswordUseCase _forgotPasswordUseCase =
      getIt<ForgotPasswordUseCase>();

  @override
  Future<void> build() async {
    return;
  }

  Future<void> forgotPassword({required String email}) async {
    DialogHelper.showLoadingDialog();
    var response = await _forgotPasswordUseCase(email);
    state = response;
    response.whenOrNull(
        data: (_) {
          DialogHelper.showSuccessDialog(
            message: 'emailSentSuccessfully',
            localMessage: true,
          );
        },
        error: (e, _) =>
            DialogHelper.showErrorDialog(message: (e as Failure).message));

    return;
  }
}
