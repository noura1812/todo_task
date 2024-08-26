import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/common/presentation/locale/notifier/locale_notifier.dart';
import '../../widgets/custom_form_dropdown.dart';

class LocaleDropDownWidget extends ConsumerWidget {
  const LocaleDropDownWidget(
      {Key? key, this.border = true, this.filled = false})
      : super(key: key);
  final bool filled;
  final bool border;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeNotifierProvider);
    return CustomFormDropDown<Locale>(
      filled: filled,
      border: border,
      isExpanded: true,
      value: locale,
      onChanged: (v) => ref
          .read(localeNotifierProvider.notifier)
          .onChangeLocale(v?.languageCode),
      items: [
        DropdownMenuItem<Locale>(
          value: const Locale('en'),
          child: Text(
            'English',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
          ),
        ),
        DropdownMenuItem<Locale>(
          value: const Locale('ar'),
          child: Text(
            'العربية',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
          ),
        ),
      ],
    );
  }
}
