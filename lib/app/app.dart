import 'package:todo/app/router.dart';
import 'package:todo/core/common/presentation/theme/notifier/theme_notifier.dart';
import 'package:todo/core/config/themes.dart';
import 'package:todo/core/extensions/localization_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/common/presentation/locale/notifier/locale_notifier.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(376, 920),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return Consumer(builder: (_, ref, __) {
            return MaterialApp.router(
              onGenerateTitle: (context) => context.localization.title,
              themeMode: ref.watch(themeNotifierProvider),
              theme: Themes.getLightTheme(),
              darkTheme: Themes.getDarkTheme(),
              locale: AppLocalizations.supportedLocales
                      .contains(ref.watch(localeNotifierProvider))
                  ? ref.watch(localeNotifierProvider)
                  : const Locale('en'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
            );
          });
        });
  }
}
