class HotelsRoomDetailsModel {
  Info? info;
  List<Rooms>? rooms;

  HotelsRoomDetailsModel({this.info, this.rooms});

  HotelsRoomDetailsModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ?   Info.fromJson(json['info']) : null;
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(  Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    if ( info != null) {
      data['info'] =  info!.toJson();
    }
    if ( rooms != null) {
      data['rooms'] =  rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? roomCount;
  String? massgeEn;
  String? massgeAr;
  String? useragent;
  String? ip;
  int? data;

  Info(
      {this.roomCount,
        this.massgeEn,
        this.massgeAr,
        this.useragent,
        this.ip,
        this.data});

  Info.fromJson(Map<String, dynamic> json) {
    roomCount = json['roomCount'];
    massgeEn = json['massge_en'];
    massgeAr = json['massge_ar'];
    useragent = json['useragent'];
    ip = json['ip'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['roomCount'] =  roomCount;
    data['massge_en'] =  massgeEn;
    data['massge_ar'] =  massgeAr;
    data['useragent'] =  useragent;
    data['ip'] =    ip;
    data['data'] =  data;
    return data;
  }
}

class Rooms {
  int? id;
  int? hotelId;
  String? name;
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
        this.name,
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
    name = json['name'];
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
    data['name'] =  name;
    data['view'] =  view;
    data['bed_room'] =    bedRoom;
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
    data['id'] =      id;
    data['value'] =   value;
    data['room_id'] = roomId;
    data['properties_id'] =  propertiesId;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_en'] =  nameEn;
    data['name_ar'] =  nameAr;
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
    data['id'] =      id;
    data['value'] =   value;
    data['room_id'] = roomId;
    data['faclilities_id'] =  faclilitiesId;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    data['name_en'] =     nameEn;
    data['name_ar'] =     nameAr;
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
    data['id'] =      id;
    data['room_id'] = roomId;
    data['image'] =   image;
    data['status'] =  status;
    data['created_at'] =  createdAt;
    data['updated_at'] =  updatedAt;
    return data;
  }
}
