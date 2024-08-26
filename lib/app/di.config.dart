// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../core/common/data/repository_impl/preferences_repository_impl.dart'
    as _i6;
import '../core/common/domain/repository/preferences_repository.dart' as _i5;
import '../core/helpers/dialog_helper.dart' as _i3;
import '../features/auth/data/data_source/auth_remote_data_source.dart' as _i8;
import '../features/auth/data/data_source/firebase_services_auth.dart' as _i7;
import '../features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i10;
import '../features/auth/domain/repository/auth_repository.dart' as _i9;
import '../features/auth/domain/usecase/delete_account_usecase.dart' as _i11;
import '../features/auth/domain/usecase/forgot_password_usecase.dart' as _i13;
import '../features/auth/domain/usecase/login_usecase.dart' as _i15;
import '../features/auth/domain/usecase/logout_usecase.dart' as _i14;
import '../features/auth/domain/usecase/register_usecase.dart' as _i12;
import 'di.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.DialogManager>(() => _i3.DialogManager());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i5.PreferencesRepository>(
        () => _i6.PreferencesRepositoryImpl(gh<_i4.SharedPreferences>()));
    gh.factory<_i7.FirebaseServicesAuth>(
        () => _i7.FirebaseServicesAuth(gh<_i5.PreferencesRepository>()));
    gh.factory<_i8.AuthRemoteDataSource>(
        () => _i8.AuthRemoteDataSourceImpl(gh<_i7.FirebaseServicesAuth>()));
    gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
          gh<_i8.AuthRemoteDataSource>(),
          gh<_i5.PreferencesRepository>(),
        ));
    gh.factory<_i11.DeleteAccountUseCase>(
        () => _i11.DeleteAccountUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i12.EmailRegisterUseCase>(
        () => _i12.EmailRegisterUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i13.ForgotPasswordUseCase>(
        () => _i13.ForgotPasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i14.LogOutUseCase>(
        () => _i14.LogOutUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i15.LoginUseCase>(
        () => _i15.LoginUseCase(gh<_i9.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
