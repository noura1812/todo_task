import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/extensions/text_style_extensions.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleSmall!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}
