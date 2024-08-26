import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../app/di.dart';
import '../../../domain/repository/preferences_repository.dart';
import '../../../../config/constants.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  late final PreferencesRepository _preferencesRepository =
      getIt<PreferencesRepository>();
  static ThemeMode defaultTheme = ThemeMode.system;

  @override
  ThemeMode build() {
    String? themeName =
        _preferencesRepository.getValueByKey(AppConstants.themeKey);

    return translateFroThemeCash(themeName) ?? defaultTheme;
  }

  Future<void> onChangeTheme(ThemeMode? themeMode) async {
    translateToThemeCash(themeMode);
    state = themeMode ?? defaultTheme;
  }

  Future<void> translateToThemeCash(ThemeMode? themeMode) async {
    if (themeMode == ThemeMode.light) {
      await _preferencesRepository.insertValueByKey(
          AppConstants.themeKey, AppConstants.lightTheme);
    } else if (themeMode == ThemeMode.dark) {
      await _preferencesRepository.insertValueByKey(
          AppConstants.themeKey, AppConstants.darkTheme);
    } else {
      await _preferencesRepository.insertValueByKey(
          AppConstants.themeKey, AppConstants.systemTheme);
    }
  }

  ThemeMode? translateFroThemeCash(String? themeName) {
    if (themeName != null) {
      if (themeName == AppConstants.lightTheme) {
        return ThemeMode.light;
      } else if (themeName == AppConstants.darkTheme) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.system;
      }
    }
    return null;
  }
}
