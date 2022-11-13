class ApartModel {
  int? status;
  int? countOffers;
  List<Offers>? offers;

  ApartModel({this.status, this.countOffers, this.offers});

  ApartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    countOffers = json['countOffers'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(  Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['status'] =  status;
    data['countOffers'] =  countOffers;
    if ( offers != null) {
      data['offers'] =  offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  int? id;
  String? title;
  String? description;
  dynamic owner;
  String? thumbnail;
  dynamic floor;
  dynamic country;
  dynamic city;
  dynamic region;
  dynamic price;
  dynamic category;
  dynamic subCategory;
  dynamic latitude;
  dynamic langtude;
  dynamic area;
  dynamic type;
  dynamic review;
  dynamic deposit;
  dynamic insurance;
  dynamic status;
  String? dateTime;
  dynamic offersId;
  String? categoryName;
  String? categoryNameAr;
  String? subCategoryName;
  String? subCategoryNameAr;
  String? countryEn;
  String? countryAr;
  String? regionEn;
  String? regionAr;
  String? cityEn;
  String? cityAr;
  String? typeAr;
  String? ownerLastNam;
  String? typeEn;
  String? ownerFirstName;
  String? ownerAvatar;
  List<Booking>? booking;
  List<Images>? images;
  bool? favorite;
  List<Amenities>? amenities;
  List<Properties>? properties;

  Offers(
      {this.id,
        this.title,
        this.description,
        this.owner,
        this.thumbnail,
        this.floor,
        this.country,
        this.city,
        this.region,
        this.price,
        this.category,
        this.subCategory,
        this.latitude,
        this.langtude,
        this.area,
        this.type,
        this.review,
        this.deposit,
        this.insurance,
        this.status,
        this.dateTime,
        this.offersId,
        this.categoryName,
        this.categoryNameAr,
        this.subCategoryName,
        this.subCategoryNameAr,
        this.countryEn,
        this.countryAr,
        this.regionEn,
        this.regionAr,
        this.cityEn,
        this.cityAr,
        this.typeAr,
        this.ownerLastNam,
        this.typeEn,
        this.ownerFirstName,
        this.ownerAvatar,
        this.booking,
        this.images,
        this.favorite,
        this.amenities,
        this.properties});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    owner = json['owner'];
    thumbnail = json['thumbnail'];
    floor = json['floor'];
    country = json['country'];
    city = json['city'];
    region = json['region'];
    price = json['price'];
    category = json['category'];
    subCategory = json['subCategory'];
    latitude = json['latitude'];
    langtude = json['langtude'];
    area = json['area'];
    type = json['type'];
    review = json['review'];
    deposit = json['deposit'];
    insurance = json['insurance'];
    status = json['status'];
    dateTime = json['dateTime'];
    offersId = json['offersId'];
    categoryName = json['categoryName'];
    categoryNameAr = json['categoryNameAr'];
    subCategoryName = json['subCategoryName'];
    subCategoryNameAr = json['subCategoryNameAr'];
    countryEn = json['countryEn'];
    countryAr = json['countryAr'];
    regionEn = json['regionEn'];
    regionAr = json['regionAr'];
    cityEn = json['cityEn'];
    cityAr = json['cityAr'];
    typeAr = json['type_ar'];
    ownerLastNam = json['ownerLastNam'];
    typeEn = json['type_en'];
    ownerFirstName = json['ownerFirstName'];
    ownerAvatar = json['ownerAvatar'];
    if (json['booking'] != null) {
      booking = <Booking>[];
      json['booking'].forEach((v) {
        booking!.add(  Booking.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(  Images.fromJson(v));
      });
    }
    favorite = json['favorite'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(  Amenities.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(  Properties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] =  id;
    data['title'] =  title;
    data['description'] =  description;
    data['owner'] =  owner;
    data['thumbnail'] =  thumbnail;
    data['floor'] =  floor;
    data['country'] =  country;
    data['city'] =  city;
    data['region'] =  region;
    data['price'] =  price;
    data['category'] =  category;
    data['subCategory'] = subCategory;
    data['latitude'] = latitude;
    data['langtude'] = langtude;
    data['area'] = area;
    data['type'] = type;
    data['review'] = review;
    data['deposit'] = deposit;
    data['insurance'] = insurance;
    data['status'] = status;
    data['dateTime'] = dateTime;
    data['offersId'] = offersId;
    data['categoryName'] = categoryName;
    data['categoryNameAr'] = categoryNameAr;
    data['subCategoryName'] = subCategoryName;
    data['subCategoryNameAr'] = subCategoryNameAr;
    data['countryEn'] = countryEn;
    data['countryAr'] = countryAr;
    data['regionEn'] = regionEn;
    data['regionAr'] = regionAr;
    data['cityEn'] = cityEn;
    data['cityAr'] = cityAr;
    data['type_ar'] = typeAr;
    data['ownerLastNam'] = ownerLastNam;
    data['type_en'] = typeEn;
    data['ownerFirstName'] = ownerFirstName;
    data['ownerAvatar'] = ownerAvatar;
    if (booking != null) {
      data['booking'] = booking!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['favorite'] = favorite;
    if (amenities != null) {
      data['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    if (properties != null) {
      data['properties'] = properties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Booking {
  String? bookingStart;
  String? bookingEnd;
  String? dateTime;

  Booking({this.bookingStart, this.bookingEnd, this.dateTime});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingStart = json['bookingStart'];
    bookingEnd = json['bookingEnd'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['bookingStart'] =bookingStart;
    data['bookingEnd'] = bookingEnd;
    data['dateTime'] = dateTime;
    return data;
  }
}

class Images {
  String? img;

  Images({this.img});

  Images.fromJson(Map<String, dynamic> json) {
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['img'] = img;
    return data;
  }
}

class Amenities {
 dynamic id;
 dynamic amenitiesId;
 dynamic offerId;
  String? amenitiesName;
  String? amenitiesNameAr;
  String? icon;
  String? iconCode;
  dynamic approval;

  Amenities(
      {this.id,
        this.amenitiesId,
        this.offerId,
        this.amenitiesName,
        this.amenitiesNameAr,
        this.icon,
        this.iconCode,
        this.approval});

  Amenities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amenitiesId = json['amenitiesId'];
    offerId = json['offerId'];
    amenitiesName = json['amenitiesName'];
    amenitiesNameAr = json['amenitiesNameAr'];
    icon = json['icon'];
    iconCode = json['iconCode'];
    approval = json['approval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['amenitiesId'] = amenitiesId;
    data['offerId'] = offerId;
    data['amenitiesName'] = amenitiesName;
    data['amenitiesNameAr'] = amenitiesNameAr;
    data['icon'] = icon;
    data['iconCode'] = iconCode;
    data['approval'] = approval;
    return data;
  }
}

class Properties {
  dynamic id;
  dynamic propertiesId;
  dynamic offerId;
  String? value;
  String? propertiesName;
  String? propertiesNameAr;
  dynamic category;
  dynamic subCategory;
  String? icon;
  String? iconCode;
  dynamic propertiesType;
  dynamic approval;

  Properties(
      {this.id,
        this.propertiesId,
        this.offerId,
        this.value,
        this.propertiesName,
        this.propertiesNameAr,
        this.category,
        this.subCategory,
        this.icon,
        this.iconCode,
        this.propertiesType,
        this.approval});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertiesId = json['propertiesId'];
    offerId = json['offerId'];
    value = json['value'];
    propertiesName = json['propertiesName'];
    propertiesNameAr = json['propertiesNameAr'];
    category = json['category'];
    subCategory = json['subCategory'];
    icon = json['icon'];
    iconCode = json['iconCode'];
    propertiesType = json['propertiesType'];
    approval = json['approval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['propertiesId'] = propertiesId;
    data['offerId'] = offerId;
    data['value'] = value;
    data['propertiesName'] = propertiesName;
    data['propertiesNameAr'] = propertiesNameAr;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['icon'] = icon;
    data['iconCode'] = iconCode;
    data['propertiesType'] = propertiesType;
    data['approval'] = approval;
    return data;
  }
}
