import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/extensions/text_style_extensions.dart';

class PageWithAppBar extends StatelessWidget {
  const PageWithAppBar(
      {Key? key,
      this.child,
      this.sliver = false,
      this.drawer,
      this.bottom,
      this.leading,
      this.scaffoldBGColor,
      this.titleText,
      this.appBarTitle,
      this.centerTitle = false,
      this.actions = const <Widget>[],
      this.endDrawer})
      : super(key: key);

  final Widget? child;
  final Widget? drawer, endDrawer;
  final PreferredSizeWidget? bottom;
  final String? titleText;
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? scaffoldBGColor;
  final Widget? leading;
  final bool sliver;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBGColor,
        drawer: drawer,
        endDrawer: endDrawer,
        appBar: sliver
            ? null
            : AppBar(
                centerTitle: centerTitle,
                actions: actions != null
                    ? [
                        ...actions!,
                        SizedBox(
                          width: 10.w,
                        )
                      ]
                    : null,
                bottom: bottom,
                leading: leading,
                title: appBarTitle ??
                    Text(
                      titleText ?? '',
                      style: context.textTheme.headlineSmall,
                    ),
              ),
        body: child,
      ),
    );
  }
}
