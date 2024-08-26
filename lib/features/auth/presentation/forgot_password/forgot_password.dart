import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:todo/core/common/presentation/widgets/custom_login_text_form_field.dart';
import 'package:todo/core/common/presentation/widgets/note_widget.dart';
import 'package:todo/core/common/presentation/widgets/pageWithAppbar/page_with_appbar.dart';
import 'package:todo/core/config/text_form_validations.dart';
import 'package:todo/core/extensions/localization_extensions.dart';
import 'package:todo/features/auth/presentation/forgot_password/notifier/notifier.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PageWithAppBar(
      titleText: context.localization.forgotYourPassword,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomNote(
                  text: context.localization.enterYourEmailForgotPassword),
              CustomLoginTextFormField(
                prefix: Icon(
                  Icons.person_outline,
                  size: 20.h,
                ),
                label: '${context.localization.userEmail} ',
                star: true,
                keyboardType: TextInputType.emailAddress,
                controller: email,
                onChanged: (v) {
                  if (_formKey.currentState!.validate()) {
                    setState(() {});
                  }
                },
                validator: (value) {
                  if (TextFormValidations.emptyField(value) ||
                      !TextFormValidations.isValidEmail(value)) {
                    return context.localization.invalidEmail;
                  }
                  return null;
                },
              ),
              CustomElevatedButton(
                enabledColor: Theme.of(context).colorScheme.secondary,
                text: context.localization.submit,
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        ref
                            .read(forgetPasswordNotifierProvider.notifier)
                            .forgotPassword(email: email.text);
                      }
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
