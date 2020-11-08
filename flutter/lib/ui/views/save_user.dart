import 'package:flutter/material.dart';
import 'package:forget_password/core/mixin/form_validator.dart';
import 'package:forget_password/core/reusable_widgets/text_form_field.dart';
import 'package:forget_password/ui/shared/styles.dart';

class SaveUser extends StatelessWidget with FormValidation {
  final double screenHeight;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  const SaveUser(
      {Key key,
      this.screenHeight,
      this.formKey,
      this.passwordController,
      this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.35,
      child: SingleChildScrollView(
              child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: this.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Save User",
                style: Styles.instance.defaultTitleStyle,
              ),
              const SizedBox(
                height: 60,
              ),
              MyTextFormField(
                maxLine: 1,
                controller: this.emailController,
                label: 'Email',
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.person_add,
                  color: Styles.instance.formPrefixIconColor,
                  size: Styles.instance.defaultPrefixIconSize,
                ),
                validator: checkEmail,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextFormField(
                controller: this.passwordController,
                showPassword: true,
                maxLine: 1,
                label: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Styles.instance.formPrefixIconColor,
                  size: Styles.instance.defaultPrefixIconSize,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
