class User {
  String mail;
  String password;

  User({this.mail, this.password});

  factory User.fromJson(Map<String, Object> json) => User(mail: json['mail'], password: json['password']);

  Map<String,dynamic> toJson() => {
    'mail' : mail,
    'password' : password
  };
}
