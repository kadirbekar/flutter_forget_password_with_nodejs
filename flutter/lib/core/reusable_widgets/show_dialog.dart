import 'package:flutter/material.dart';

class CustomShowDialog {
  static CustomShowDialog? _instance;
  static CustomShowDialog get instance {
    if (_instance == null) _instance = CustomShowDialog._initialize();
    return _instance!;
  }

  showFormDialog({
    required BuildContext context,
    required Widget content,
    required void Function() acceptButton,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Container(
        child: Container(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: [
              TextButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                  ),
                  label: Text("Cancel", style: TextStyle(color: Colors.red))),
              TextButton.icon(
                onPressed: acceptButton,
                icon: Icon(
                  Icons.done_all,
                  color: Colors.green,
                ),
                label: Text(
                  "Accept",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
            content: content,
          ),
        ),
      ),
    );
  }

  CustomShowDialog._initialize();
}
