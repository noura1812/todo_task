import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../app/di.dart';
import '../../../../../core/common/domain/repository/preferences_repository.dart';
import '../../../../../core/config/constants.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier{

  late final PreferencesRepository _preferencesRepository = getIt<PreferencesRepository>();
  static const String defaultLanguageCode = 'en';


  @override
  Locale build() {
     String localeName = _preferencesRepository.getValueByKey(AppConstants.localeKey) ?? defaultLanguageCode;
    return Locale(localeName);
  }

  Future<void> onChangeLocale(String? localeName) async {
    _preferencesRepository.insertValueByKey(AppConstants.localeKey, localeName);
    state = Locale(localeName ?? defaultLanguageCode);
  }

}
