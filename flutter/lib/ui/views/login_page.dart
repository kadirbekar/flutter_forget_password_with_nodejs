import 'package:flutter/material.dart';
import 'package:forget_password/core/mixin/form_validator.dart';
import 'package:forget_password/core/models/user_model.dart';
import 'package:forget_password/core/reusable_widgets/message_dialog.dart';
import 'package:forget_password/core/reusable_widgets/outlined_button.dart';
import 'package:forget_password/core/reusable_widgets/show_dialog.dart';
import 'package:forget_password/core/services/api_service.dart';
import 'package:forget_password/core/states/request_state.dart';
import 'package:forget_password/locator.dart';
import 'package:forget_password/ui/shared/styles.dart';
import 'package:forget_password/ui/views/check_user.dart';
import 'package:forget_password/ui/views/forget_password.dart';
import 'package:forget_password/ui/views/save_user.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormValidation {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  double screenWidth;
  double screenHeight;

  final apiService = locator<ApiService>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: appbar,
        body: Consumer<RequestState>(
          builder: (context, requestState, widget) => requestState.isFetching
              ? Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.orange[100], Colors.blueAccent[100]]),
                  ),
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      saveUser(requestState),
                      const SizedBox(height: 15),
                      forgetPassword(requestState),
                      const SizedBox(height: 15),
                      checkUser(requestState),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget get appbar => AppBar(
        title: Text(
          "Forget Password with Node.js",
          style: Styles.instance.snackbarTitleStyle,
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      );

  Widget saveUser(RequestState requestState) => DefaultOutlineButton(
        onPressed: () {
          CustomShowDialog.instance.showFormDialog(
              context,
              requestState,
              SaveUser(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                screenHeight: screenHeight,
              ), acceptButton: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              Navigator.of(context).pop();
              await apiService
                  .saveUser(User(
                      mail: _emailController.text,
                      password: _passwordController.text))
                  .then((value) {
                showSnackbarMessage(value.message, value.ok ? true : false);
                _emailController.clear();
                _passwordController.clear();
              });
            }
          });
        },
        height: screenHeight * 0.09,
        width: double.infinity,
        buttonLabel: 'Save User',
        textStyle: Styles.instance.defaultButtonTextStyle,
        icon: Icon(
          Icons.person_add,
          color: Styles.instance.defaultPrefixIconColor,
          size: Styles.instance.defaultPrefixIconSize,
        ),
      );

  Widget forgetPassword(RequestState requestState) => DefaultOutlineButton(
        onPressed: () {
          CustomShowDialog.instance.showFormDialog(
              context,
              requestState,
              ForgetPassword(
                  screenHeight: screenHeight,
                  emailController: _emailController,
                  formKey: _formKey), acceptButton: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              Navigator.of(context).pop();
              await apiService
                  .forgetPassword(_emailController.text)
                  .then((value) {
                showSnackbarMessage(value.message, value.ok ? true : false);
                _emailController.clear();
              });
            }
          });
        },
        buttonLabel: 'Forget Password',
        height: screenHeight * 0.09,
        width: double.infinity,
        textStyle: Styles.instance.defaultButtonTextStyle,
        icon: Icon(
          Icons.mail,
          color: Styles.instance.defaultPrefixIconColor,
          size: Styles.instance.defaultPrefixIconSize,
        ),
      );

  Widget checkUser(RequestState requestState) => DefaultOutlineButton(
        onPressed: () {
          CustomShowDialog.instance.showFormDialog(
              context,
              requestState,
              CheckUser(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
                screenHeight: screenHeight,
              ), acceptButton: () async {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              Navigator.of(context).pop();
              await apiService
                  .checkUser(User(
                      mail: _emailController.text,
                      password: _passwordController.text))
                  .then((value) {
                showSnackbarMessage(value.message, value.ok ? true : false);
                _emailController.clear();
                _passwordController.clear();
              });
            }
          });
        },
        height: screenHeight * 0.09,
        width: double.infinity,
        buttonLabel: 'Check User',
        textStyle: Styles.instance.defaultButtonTextStyle,
        icon: Icon(
          Icons.check_circle_outline,
          color: Styles.instance.defaultPrefixIconColor,
          size: Styles.instance.defaultPrefixIconSize,
        ),
      );

  showSnackbarMessage(String message, bool isSuccess) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: CustomMessageDialog.instance.showMessageDialog(
      context: context, isSuccess: isSuccess, message: message),
      duration: Duration(milliseconds: Styles.instance.snackbarMessageDuration),
    ));
  }
}
