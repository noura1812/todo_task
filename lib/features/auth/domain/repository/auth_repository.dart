import 'dart:async';
import 'package:todo/core/enum/social_login_enum.dart';
import 'package:todo/features/auth/domain/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  Future<AsyncValue<User?>> getUser();
  Future<AsyncValue<User?>> login(
      {required String password, required String email});
  Future<AsyncValue<void>> signOut();
  Future<AsyncValue<User?>> emailRegister(User user);
  Future<AsyncValue<void>> deleteAccount();

  Future<AsyncValue<void>> forgotPassword(String email);
}
