mixin FormValidation {
  String checkValue(String value) {
    if (value.length <= 0) {
      return "fill required";
    }
    return null;
  }

  String checkEmail(String deger) {
    String email =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(email);
    if (deger.length == 0) {
      return "Email is required";
    } else if (!regExp.hasMatch(deger)) {
      return "Invalid address";
    } else {
      return null;
    }
  }
}
