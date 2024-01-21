mixin FormValidation {
  String? checkValue(String value) {
    if (value.length <= 0) {
      return "fill required";
    }
    return null;
  }

  String? checkEmail(String? value) {
    String email =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (value == null || value.isEmpty) {
      return null;
    }

    RegExp regExp = new RegExp(email);
    if (value.length == 0) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid address";
    } else {
      return null;
    }
  }
}
