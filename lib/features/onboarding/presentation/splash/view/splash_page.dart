import 'package:todo/features/auth/presentation/login/notifier/notifier.dart';
import 'package:todo/features/onboarding/presentation/splash/widgets/splash_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/routes.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  bool _animationDone = false;

  void _navigate() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(Routes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(authNotifierProvider);
    if (!userState.isLoading && _animationDone) {
      _navigate();
    }
    return Scaffold(
      body: SplashThumbnail(
        onEnd: () {
          setState(() {
            _animationDone = true;
          });
        },
      ),
    );
  }
}
