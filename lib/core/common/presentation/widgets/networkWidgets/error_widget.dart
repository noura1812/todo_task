import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/extensions/localization_extensions.dart';
import 'package:todo/core/network/error/failure.dart';
import 'package:todo/core/extensions/text_style_extensions.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget(
      {super.key, required this.error, required this.refresh});
  final Failure error;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            error.message == null || error.message!.trim().isEmpty
                ? context.localization.errorResponse('somethingWentWrong')
                : error.message!,
            style: context.textTheme.titleSmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 20.h,
        ),
        FilledButton(
            onPressed: () {
              refresh();
            },
            child: Text(context.localization.tryAgain,
                style: context.textTheme.titleSmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)))
      ],
    ));
  }
}
