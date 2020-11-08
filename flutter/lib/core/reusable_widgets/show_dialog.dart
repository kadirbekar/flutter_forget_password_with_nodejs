import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forget_password/core/states/request_state.dart';

class CustomShowDialog {
  static CustomShowDialog _instance;
  static CustomShowDialog get instance {
    if (_instance == null) _instance = CustomShowDialog._initialize();
    return _instance;
  }

  showFormDialog(BuildContext context,RequestState requestState, Widget content,{Function acceptButton}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Container(
        child: Container(
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: [
              FlatButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back,color: Colors.red,),
                  label: Text("Cancel",style: TextStyle(color: Colors.red))),
              FlatButton.icon(
                  onPressed: acceptButton,
                  icon: Icon(Icons.done_all,color: Colors.green,),
                  label: Text("Accept",style: TextStyle(color: Colors.green))),
            ],
            content: content,
          ),
        ),
      ),
    );
  }

  CustomShowDialog._initialize();
}
