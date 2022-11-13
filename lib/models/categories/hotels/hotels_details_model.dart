class HotelsDetailsModel {
  List<Details>? details;

  HotelsDetailsModel({this.details});

  HotelsDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(  Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    if ( details != null) {
      data['details'] =  details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
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
  List<Rooms>? rooms;
  List<Facility>? facility;

  Details(
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
        this.rooms,
        this.facility});

  Details.fromJson(Map<String, dynamic> json) {
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
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(  Rooms.fromJson(v));
      });
    }
    if (json['facility'] != null) {
      facility = <Facility>[];
      json['facility'].forEach((v) {
        facility!.add(  Facility.fromJson(v));
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
    data['cityId'] =    cityId;
    data['stars'] =     stars;
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
    if ( rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    if ( facility != null) {
      data['facility'] = facility!.map((v) => v.toJson()).toList();
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

class Rooms {
  int? id;
  int? hotelId;
  String? view;
  String? bedRoom;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Beds>? beds;
  List<Properties>? properties;
  List<Faclilities>? faclilities;
  List<Thumbnail>? thumbnail;

  Rooms(
      {this.id,
        this.hotelId,
        this.view,
        this.bedRoom,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.beds,
        this.properties,
        this.faclilities,
        this.thumbnail});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    view = json['view'];
    bedRoom = json['bed_room'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['beds'] != null) {
      beds = <Beds>[];
      json['beds'].forEach((v) {
        beds!.add(  Beds.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(  Properties.fromJson(v));
      });
    }
    if (json['faclilities'] != null) {
      faclilities = <Faclilities>[];
      json['faclilities'].forEach((v) {
        faclilities!.add(  Faclilities.fromJson(v));
      });
    }
    if (json['thumbnail'] != null) {
      thumbnail = <Thumbnail>[];
      json['thumbnail'].forEach((v) {
        thumbnail!.add(  Thumbnail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =        id;
    data['hotel_id'] =  hotelId;
    data['view'] =      view;
    data['bed_room'] =  bedRoom;
    data['status'] =      status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    if ( beds != null) {
      data['beds'] =  beds!.map((v) => v.toJson()).toList();
    }
    if ( properties != null) {
      data['properties'] =  properties!.map((v) => v.toJson()).toList();
    }
    if ( faclilities != null) {
      data['faclilities'] =  faclilities!.map((v) => v.toJson()).toList();
    }
    if ( thumbnail != null) {
      data['thumbnail'] =  thumbnail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Beds {
  int? id;
  int? roomId;
  int? bedsId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? nameEn;
  String? nameAr;

  Beds(
      {this.id,
        this.roomId,
        this.bedsId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameAr});

  Beds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    bedsId = json['beds_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =       id;
    data['room_id'] =  roomId;
    data['beds_id'] =  bedsId;
    data['status'] =   status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_en'] =     nameEn;
    data['name_ar'] =     nameAr;
    return data;
  }
}

class Properties {
  int? id;
  int? value;
  int? roomId;
  int? propertiesId;
  String? createdAt;
  String? updatedAt;
  String? nameEn;
  String? nameAr;

  Properties(
      {this.id,
        this.value,
        this.roomId,
        this.propertiesId,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameAr});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    roomId = json['room_id'];
    propertiesId = json['properties_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =       id;
    data['value'] =    value;
    data['room_id'] =  roomId;
    data['properties_id'] =  propertiesId;
    data['created_at'] =     createdAt;
    data['updated_at'] =     updatedAt;
    data['name_en'] =        nameEn;
    data['name_ar'] =        nameAr;
    return data;
  }
}

class Faclilities {
  int? id;
  int? value;
  int? roomId;
  int? faclilitiesId;
  Null? createdAt;
  Null? updatedAt;
  String? nameEn;
  String? nameAr;

  Faclilities(
      {this.id,
        this.value,
        this.roomId,
        this.faclilitiesId,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameAr});

  Faclilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    roomId = json['room_id'];
    faclilitiesId = json['faclilities_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =       id;
    data['value'] =    value;
    data['room_id'] =  roomId;
    data['faclilities_id'] =  faclilitiesId;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_en'] =  nameEn;
    data['name_ar'] =  nameAr;
    return data;
  }
}

class Thumbnail {
  int? id;
  int? roomId;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Thumbnail(
      {this.id,
        this.roomId,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =       id;
    data['room_id'] =  roomId;
    data['image'] =    image;
    data['status'] =   status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    return data;
  }
}

class Facility {
  int? id;
  int? facilityId;
  int? hotelId;
  String? createdAt;
  String? updatedAt;
  String? nameEn;
  String? nameAr;

  Facility(
      {this.id,
        this.facilityId,
        this.hotelId,
        this.createdAt,
        this.updatedAt,
        this.nameEn,
        this.nameAr});

  Facility.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    facilityId = json['facility_id'];
    hotelId = json['hotel_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =  id;
    data['facility_id'] = facilityId;
    data['hotel_id'] =    hotelId;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_en'] =  nameEn;
    data['name_ar'] =  nameAr;
    return data;
  }
}
