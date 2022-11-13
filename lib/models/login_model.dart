class LoginModel {
  String? status;
  String? msg;
  int? code;
  Data? data;

  LoginModel({this.status, this.msg, this.code, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? userName;
  String? email;
  String? fullName;
  int? mobile;
  int? country;
  int? city;
  int? region;
  String? address;
  String? avatar;
  int? code;
  int? activity;
  int? deleted;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.userName,
        this.email,
        this.fullName,
        this.mobile,
        this.country,
        this.city,
        this.region,
        this.address,
        this.avatar,
        this.code,
        this.activity,
        this.deleted,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    fullName = json['fullName'];
    mobile = json['mobile'];
    country = json['country'];
    city = json['city'];
    region = json['region'];
    address = json['address'];
    avatar = json['avatar'];
    code = json['code'];
    activity = json['activity'];
    deleted = json['deleted'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =  id;
    data['userName'] =  userName;
    data['email'] =  email;
    data['fullName'] =  fullName;
    data['mobile'] =  mobile;
    data['country'] =  country;
    data['city'] =  city;
    data['region'] =  region;
    data['address'] =  address;
    data['avatar'] =  avatar;
    data['code'] =  code;
    data['activity'] =  activity;
    data['deleted'] =  deleted;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
