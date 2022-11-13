class RegisterModel {
  String? status;
  String? msg;
  int? code;
  Data? data;

  RegisterModel({this.status, this.msg, this.code, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null ?   Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['status'] =  status;
    data['msg'] =  msg;
    data['code'] =  code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ?   User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['token'] =  token;
    if ( user != null) {
      data['user'] =  user!.toJson();
    }
    return data;
  }
}

class User {
  String? userName;
  String? email;
  String? fullName;
  String? mobile;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.userName,
        this.email,
        this.fullName,
        this.mobile,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    fullName = json['fullName'];
    mobile = json['mobile'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['userName'] =  userName;
    data['email'] =  email;
    data['fullName'] =  fullName;
    data['mobile'] =  mobile;
    data['updated_at'] =  updatedAt;
    data['created_at'] =  createdAt;
    data['id'] =  id;
    return data;
  }
}
