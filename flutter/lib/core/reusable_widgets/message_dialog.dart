import 'package:flutter/material.dart';
import 'package:forget_password/ui/shared/styles.dart';

class CustomMessageDialog {
  static CustomMessageDialog _instance;
  static CustomMessageDialog get instance {
    if (_instance == null) _instance = CustomMessageDialog._initialize();
    return _instance;
  }

  Widget showMessageDialog({BuildContext context, String message, bool isSuccess}) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Icon(
              isSuccess ? Icons.done : Icons.error_outline,
              color: isSuccess ? Styles.instance.successIconColor : Styles.instance.errorIconColor,
              size: Styles.instance.messageDialogIconSize,
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            flex: 3,
            child: Text(
              message,
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  CustomMessageDialog._initialize();
}
