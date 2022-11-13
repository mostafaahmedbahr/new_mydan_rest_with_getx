class CitiesForHotelsModel {
  int? status;
  String? msg;
  int? code;
  List<Data>? data;

  CitiesForHotelsModel({this.status, this.msg, this.code, this.data});

  CitiesForHotelsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(  Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['status'] =  status;
    data['msg'] =     msg;
    data['code'] =    code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? cityEn;
  String? cityAr;
  String? img;
  int? countryId;

  Data({this.id, this.cityEn, this.cityAr, this.img, this.countryId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityEn = json['cityEn'];
    cityAr = json['cityAr'];
    img = json['img'];
    countryId = json['countryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =         id;
    data['cityEn'] =     cityEn;
    data['cityAr'] =     cityAr;
    data['img'] =        img;
    data['countryId'] =  countryId;
    return data;
  }
}
