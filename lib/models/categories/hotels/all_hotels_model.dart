class AllHotelsModel {
  int? status;
  int? count;
  List<Hotel>? hotel;

  AllHotelsModel({this.status, this.count, this.hotel});

  AllHotelsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['hotel'] != null) {
      hotel = <Hotel>[];
      json['hotel'].forEach((v) {
        hotel!.add(  Hotel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['status'] =  status;
    data['count'] =   count;
    if ( hotel != null) {
      data['hotel'] =  hotel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hotel {
  int? id;
  String? title;
  String? description;
  int? price;
  String? owner;
  String? thumbnail;
  int? cityId;
  int? stars;
  int? latitude;
  int? langtude;
  String? area;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<CityInfo>? cityInfo;
  List<Images>? images;
  List<Boards>? boards;
  List<Entertainement>? entertainement;

  Hotel(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.owner,
        this.thumbnail,
        this.cityId,
        this.stars,
        this.latitude,
        this.langtude,
        this.area,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.cityInfo,
        this.images,
        this.boards,
        this.entertainement});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    owner = json['owner'];
    thumbnail = json['thumbnail'];
    cityId = json['cityId'];
    stars = json['stars'];
    latitude = json['latitude'];
    langtude = json['langtude'];
    area = json['area'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cityInfo'] != null) {
      cityInfo = <CityInfo>[];
      json['cityInfo'].forEach((v) {
        cityInfo!.add(  CityInfo.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(  Images.fromJson(v));
      });
    }
    if (json['boards'] != null) {
      boards = <Boards>[];
      json['boards'].forEach((v) {
        boards!.add(  Boards.fromJson(v));
      });
    }
    if (json['entertainement'] != null) {
      entertainement = <Entertainement>[];
      json['entertainement'].forEach((v) {
        entertainement!.add(  Entertainement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =     id;
    data['title'] =  title;
    data['description'] =  description;
    data['price'] =  price;
    data['owner'] =  owner;
    data['thumbnail'] =  thumbnail;
    data['cityId'] =  cityId;
    data['stars'] =   stars;
    data['latitude'] =  latitude;
    data['langtude'] =  langtude;
    data['area'] =      area;
    data['status'] =    status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    if ( cityInfo != null) {
      data['cityInfo'] =  cityInfo!.map((v) => v.toJson()).toList();
    }
    if ( images != null) {
      data['images'] =  images!.map((v) => v.toJson()).toList();
    }
    if ( boards != null) {
      data['boards'] =  boards!.map((v) => v.toJson()).toList();
    }
    if ( entertainement != null) {
      data['entertainement'] =
           entertainement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityInfo {
  int? id;
  String? cityEn;
  String? cityAr;
  String? img;
  int? countryId;

  CityInfo({this.id, this.cityEn, this.cityAr, this.img, this.countryId});

  CityInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityEn = json['cityEn'];
    cityAr = json['cityAr'];
    img = json['img'];
    countryId = json['countryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =      id;
    data['cityEn'] =  cityEn;
    data['cityAr'] =  cityAr;
    data['img'] =     img;
    data['countryId'] =  countryId;
    return data;
  }
}

class Images {
  int? id;
  int? hotelId;
  String? img;
  String? createdAt;
  String? updatedAt;

  Images({this.id, this.hotelId, this.img, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =          id;
    data['hotel_id'] =    hotelId;
    data['img'] =         img;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    return data;
  }
}

class Boards {
  int? id;
  int? hotelId;
  int? serviceId;
  int? price;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? nameAr;
  String? nameEn;
  String? nameFr;

  Boards(
      {this.id,
        this.hotelId,
        this.serviceId,
        this.price,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.nameAr,
        this.nameEn,
        this.nameFr});

  Boards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    serviceId = json['serviceId'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameFr = json['name_fr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =          id;
    data['hotel_id'] =    hotelId;
    data['serviceId'] =   serviceId;
    data['price'] =       price;
    data['status'] =      status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_ar'] =     nameAr;
    data['name_en'] =     nameEn;
    data['name_fr'] =     nameFr;
    return data;
  }
}

class Entertainement {
  int? id;
  int? hotelId;
  int? serviceId;
  int? price;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? nameAr;
  String? nameEn;

  Entertainement(
      {this.id,
        this.hotelId,
        this.serviceId,
        this.price,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.nameAr,
        this.nameEn});

  Entertainement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    serviceId = json['serviceId'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =         id;
    data['hotel_id'] =   hotelId;
    data['serviceId'] =  serviceId;
    data['price'] =      price;
    data['status'] =     status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_ar'] =     nameAr;
    data['name_en'] =     nameEn;
    return data;
  }
}
