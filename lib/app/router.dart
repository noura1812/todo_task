import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/auth/presentation/forgot_password/forgot_password.dart';
import 'package:todo/features/auth/presentation/login/notifier/notifier.dart';
import 'package:todo/features/onboarding/presentation/splash/view/splash_page.dart';
import '../core/config/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    initialLocation: Routes.splashPage,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.splashPage,
        name: Routes.splashPage,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<void>(key: state.pageKey, child: const SplashPage()),
      ),
      GoRoute(
        path: Routes.forgotPasswordPage,
        name: Routes.forgotPasswordPage,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<void>(
                key: state.pageKey, child: const ForgotPasswordPage()),
      ),
    ]);

String? _authRedirect(BuildContext context, GoRouterState state) {
  final user =
      ProviderScope.containerOf(context).read(authNotifierProvider).valueOrNull;
  if (user == null) {
    return Routes.loginPage;
  }
  return null;
}
