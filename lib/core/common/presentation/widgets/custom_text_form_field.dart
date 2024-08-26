// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/extensions/text_style_extensions.dart';

typedef StringOrNullTransformer = String? Function(String? input);

enum FormTextFieldType { textField, dropdownField }

class CustomTextFormField extends StatefulWidget {
  final double? width;
  final String? labelText;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final String? hintText;
  final AutovalidateMode? autovalidateMode;
  final String? label;
  final bool? autofocus;
  final int? maxLines, minLines, maxLength;
  final TextStyle? labelStyle;
  final bool filled;
  final double? radius;
  final bool star;
  final String? icon;
  final VoidCallback? suffixIconTap;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool obscureText;
  final FormTextFieldType type;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor, borderColor;
  final Iterable<String>? autofillHints;
  final StringOrNullTransformer? validator;
  final TextCapitalization? textCapitalization;
  const CustomTextFormField({
    Key? key,
    this.enabled = true,
    this.width,
    this.labelStyle,
    this.autovalidateMode,
    this.autofocus,
    this.padding,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.label,
    this.fillColor,
    this.star = false,
    this.filled = false,
    this.icon,
    this.suffixIconTap,
    this.controller,
    this.hintStyle,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.obscureText = false,
    this.type = FormTextFieldType.textField,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.initialValue,
    this.validator,
    this.textCapitalization,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofillHints,
    this.style,
    this.borderColor,
    this.radius,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool get _isDropdown => widget.type == FormTextFieldType.dropdownField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.only(top: 10.h, bottom: 10.h),
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.label!,
                  style: context.textTheme.displaySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                if (widget.star)
                  Text(
                    '*',
                    style: context.textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ),
              ],
            ),
          if (widget.label != null)
            SizedBox(
              height: 10.h,
            ),
          TextFormField(
            autofillHints: widget.autofillHints,
            autofocus: widget.autofocus ?? false,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
            cursorColor: Theme.of(context).primaryColor,
            showCursor: !_isDropdown,
            autocorrect: true,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            enableSuggestions: true,
            inputFormatters: widget.inputFormatters,
            readOnly: _isDropdown,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            controller: widget.initialValue != null ? null : widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.next,
            validator: widget.validator,
            obscureText: widget.obscureText,
            style: widget.style ?? context.textTheme.displaySmall,
            decoration: InputDecoration(
              filled: widget.filled == true || widget.enabled == false,
              fillColor: widget.fillColor,
              prefixIcon: widget.icon != null
                  ? Container(
                      width: 10.h,
                      height: 10.h,
                      margin: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: widget.icon != null
                            ? DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  widget.icon!,
                                ),
                              )
                            : null,
                      ),
                    )
                  : widget.prefix,
              suffixIcon: widget.suffixIcon != null
                  ? InkWell(
                      onTap: widget.suffixIconTap,
                      child: widget.suffixIcon,
                    )
                  : null,
              suffix: widget.suffix,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              labelText: widget.labelText,
              labelStyle: context.textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).disabledColor, fontSize: 15.sp),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  context.textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).disabledColor, fontSize: 15.sp),
              border: formBorder(),
              enabledBorder: formBorder(),
              errorBorder: formBorder().copyWith(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error)),
              errorMaxLines: 3,
              errorStyle: context.textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.error, fontSize: 11.sp),
              focusedBorder: formBorder().copyWith(
                  borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              )),
              focusedErrorBorder: formBorder().copyWith(
                  borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              )),
              disabledBorder: formBorder(),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder formBorder() {
    return widget.filled
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
            borderSide: BorderSide(
                width: .5.w,
                color: widget.borderColor ??
                    Theme.of(context).secondaryHeaderColor),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
            borderSide: BorderSide(
              width: 1.2.w,
              color:
                  widget.borderColor ?? Theme.of(context).secondaryHeaderColor,
            ),
          );
  }
}
