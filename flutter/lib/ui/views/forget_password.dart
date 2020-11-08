import 'package:flutter/material.dart';
import 'package:forget_password/core/mixin/form_validator.dart';
import 'package:forget_password/core/reusable_widgets/text_form_field.dart';
import 'package:forget_password/ui/shared/styles.dart';

class ForgetPassword extends StatelessWidget with FormValidation {
  final double screenHeight;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  const ForgetPassword({Key key,this.screenHeight,this.emailController,this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.25,
      child: SingleChildScrollView(
              child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: this.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forget Password",
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
                  Icons.email,
                  color: Styles.instance.formPrefixIconColor,
                  size: Styles.instance.defaultPrefixIconSize,
                ),
                validator: checkEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
