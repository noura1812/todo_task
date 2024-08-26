import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/extensions/text_style_extensions.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      this.child,
      this.onPressed,
      this.width,
      this.text,
      this.enabledColor,
      this.margin,
      this.height});
  final Function? onPressed;
  final Widget? child;
  final String? text;
  final EdgeInsetsGeometry? margin;
  final double? width, height;
  final Color? enabledColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Theme.of(context).disabledColor,
              fixedSize: Size(250.w, 60.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor:
                  enabledColor ?? Theme.of(context).colorScheme.primary),
          onPressed: onPressed == null
              ? null
              : () {
                  onPressed!();
                },
          child: child ??
              Text(
                text ?? '',
                style: context.textTheme.headlineSmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              )),
    );
  }
}
