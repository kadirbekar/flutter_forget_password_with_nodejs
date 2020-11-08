import 'package:flutter/cupertino.dart';

class RequestState with ChangeNotifier {
  bool isFetching = false;

  makeStateBusy(){
    isFetching = true;
    notifyListeners();
  }

  makeStateNormal(){
    isFetching = false;
    notifyListeners();
  }
}