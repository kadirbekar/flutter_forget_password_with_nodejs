class ResponseModel {
  bool ok;
  String message;

  ResponseModel({this.ok, this.message});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['message'] = this.message;
    return data;
  }
}

