class CarsModel {
  List<Cars>? cars;

  CarsModel({this.cars});

  CarsModel.fromJson(Map<String, dynamic> json) {
    if (json['cars'] != null) {
      cars = <Cars>[];
      json['cars'].forEach((v) {
        cars!.add(Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    if (cars != null) {
      data['cars'] = cars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cars {
  String? description;
  int? carId;
  int? passengerCount;
  String? plateNumber;
  String? img;
  String? available;
  int? status;
  String? dateTime;
  String? colorEn;
  String? colorAr;
  String? brandEn;
  String? brandAr;
  String? nameEn;
  String? nameAr;
  int? brandId;
  // List<Null>? reservations;
  bool? check;

  Cars(
      {this.description,
        this.carId,
        this.passengerCount,
        this.plateNumber,
        this.img,
        this.available,
        this.status,
        this.dateTime,
        this.colorEn,
        this.colorAr,
        this.brandEn,
        this.brandAr,
        this.nameEn,
        this.nameAr,
        this.brandId,
        // this.reservations,
        this.check});

  Cars.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    carId = json['carId'];
    passengerCount = json['passengerCount'];
    plateNumber = json['plateNumber'];
    img = json['img'];
    available = json['available'];
    status = json['status'];
    dateTime = json['dateTime'];
    colorEn = json['colorEn'];
    colorAr = json['colorAr'];
    brandEn = json['brandEn'];
    brandAr = json['brandAr'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    brandId = json['brandId'];
    // if (json['reservations'] != null) {
    //   reservations = <Null>[];
    //   json['reservations'].forEach((v) {
    //     reservations!.add(new Null.fromJson(v));
    //   });
    // }
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['description'] = description;
    data['carId'] = carId;
    data['passengerCount'] = passengerCount;
    data['plateNumber'] = plateNumber;
    data['img'] = img;
    data['available'] =  available;
    data['status'] =     status;
    data['dateTime'] =   dateTime;
    data['colorEn'] =    colorEn;
    data['colorAr'] =    colorAr;
    data['brandEn'] =    brandEn;
    data['brandAr'] =    brandAr;
    data['nameEn'] =     nameEn;
    data['nameAr'] =     nameAr;
    data['brandId'] =    brandId;
    // if (this.reservations != null) {
    //   data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    // }
    data['check'] = check;
    return data;
  }
}
