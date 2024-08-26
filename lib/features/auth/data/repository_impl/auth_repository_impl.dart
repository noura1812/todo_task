import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/core/common/domain/repository/preferences_repository.dart';
import 'package:todo/core/config/constants.dart';

import '../../../../core/network/error/error_handler.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authRemoteDataSource, this.preferencesRepository);

  final AuthRemoteDataSource authRemoteDataSource;
  final PreferencesRepository preferencesRepository;

  @override
  Future<AsyncValue<User?>> emailRegister(User user) async {
    try {
      final userResponse = await authRemoteDataSource.emailRegister(user);

      await preferencesRepository.insertValueByKey(
          AppConstants.uId, userResponse!.id!);
      return AsyncData(userResponse);
    } catch (e) {
      return AsyncError(ErrorHandler.handleError(e), StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<void>> deleteAccount() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      if (auth.currentUser != null) {
        await auth.signOut();
      }
      await authRemoteDataSource.deleteAccount();
      Future.wait([
        preferencesRepository.removeValueByKey(AppConstants.uId),
      ]);
      return const AsyncData(null);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return AsyncError(ErrorHandler.handleError(e), StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<void>> signOut() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      if (auth.currentUser != null) {
        await auth.signOut();
      }
      await authRemoteDataSource.logout();
      preferencesRepository.removeValueByKey(AppConstants.uId);
      return const AsyncData(null);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return AsyncError(ErrorHandler.handleError(e), StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<User?>> login(
      {required String password, required String email}) async {
    try {
      final userResponse = await authRemoteDataSource.emailLogin(
          email: email, password: password);

      await preferencesRepository.insertValueByKey(
          AppConstants.uId, userResponse!.id!);
      return AsyncData(userResponse);
    } catch (e) {
      return AsyncError(ErrorHandler.handleError(e), StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<User?>> getUser() async {
    try {
      final user = await authRemoteDataSource.getUser();
      return AsyncData(user);
    } catch (e) {
      if (kDebugMode) {
        print('getUserError$e');
      }
      return AsyncError(ErrorHandler.handleError(e), StackTrace.current);
    }
  }

  @override
  Future<AsyncValue<void>> forgotPassword(String email) async {
    try {
      await authRemoteDataSource.forgotPassword(email);
      return const AsyncData(null);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return AsyncError(ErrorHandler.handleError(e), StackTrace.current);
    }
  }
}
