import 'package:flutter/material.dart';

class Styles {
  static Styles _instance;
  static Styles get instance {
    if (_instance == null) _instance = Styles._initialize();
    return _instance;
  }

  Styles._initialize();

  TextStyle defaultButtonTextStyle = TextStyle(fontSize: 18, color: Colors.white);
  TextStyle defaultTitleStyle = TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 1.3);
  Color defaultPrefixIconColor = Colors.white; double defaultPrefixIconSize = 32.0;
  Color formPrefixIconColor = Colors.black;
  TextStyle snackbarTitleStyle = TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 1.1);

  Color successIconColor = Colors.green;
  Color errorIconColor = Colors.red;
  double messageDialogIconSize = 24;
  int snackbarMessageDuration = 1300;
}
