import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/common/presentation/theme/notifier/theme_notifier.dart';
import 'package:todo/core/extensions/localization_extensions.dart';
import '../../widgets/custom_form_dropdown.dart';
import 'package:todo/core/extensions/text_style_extensions.dart';

class ThemeDropDownWidget extends ConsumerWidget {
  const ThemeDropDownWidget({Key? key, this.border = true, this.filled = false})
      : super(key: key);
  final bool filled;
  final bool border;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);
    return CustomFormDropDown<ThemeMode>(
      isExpanded: true,
      filled: filled,
      border: border,
      value: theme,
      onChanged: (v) =>
          ref.read(themeNotifierProvider.notifier).onChangeTheme(v),
      items: [
        DropdownMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.0.h,
              minWidth: 10.0.w,
              maxHeight: 100.0.h,
              maxWidth: 95.0.w,
            ),
            child: Text(
              context.localization.darkTheme,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
            ),
          ),
        ),
        DropdownMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.0.h,
              minWidth: 10.0.w,
              maxHeight: 100.0.h,
              maxWidth: 95.0.w,
            ),
            child: Text(
              context.localization.lightTheme,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
            ),
          ),
        ),
        DropdownMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.0.h,
              minWidth: 10.0.w,
              maxHeight: 100.0.h,
              maxWidth: 95.0.w,
            ),
            child: Text(
              context.localization.systemMode,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 15.sp),
            ),
          ),
        ),
      ],
    );
  }
}
