class HotelDetail {
  final String? message;
  final HotelDetailData? data;

  HotelDetail({
    this.message,
    this.data,
  });

  HotelDetail.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? HotelDetailData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.toJson()
  };
}

class HotelDetailData {
  final int? id;
  final String? title;
  final String? location;
  final String? description;
  final String? rating;
  final List<String>? mostPopularFacilities;
  final RoomsInfo? roomsInfo;
  final List<String>? imageUrl;

  HotelDetailData({
    this.id,
    this.title,
    this.location,
    this.description,
    this.rating,
    this.mostPopularFacilities,
    this.roomsInfo,
    this.imageUrl,
  });

  HotelDetailData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        location = json['location'] as String?,
        description = json['description'] as String?,
        rating = json['rating'] as String?,
        mostPopularFacilities = (json['most_popular_facilities'] as List?)?.map((dynamic e) => e as String).toList(),
        roomsInfo = (json['rooms_info'] as Map<String,dynamic>?) != null ? RoomsInfo.fromJson(json['rooms_info'] as Map<String,dynamic>) : null,
        imageUrl = (json['image_url'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'location' : location,
    'description' : description,
    'rating' : rating,
    'most_popular_facilities' : mostPopularFacilities,
    'rooms_info' : roomsInfo?.toJson(),
    'image_url' : imageUrl
  };
}

class RoomsInfo {
  final List<String>? roomType;
  final List<int>? roomPrice;

  RoomsInfo({
    this.roomType,
    this.roomPrice,
  });

  RoomsInfo.fromJson(Map<String, dynamic> json)
      : roomType = (json['room_type'] as List?)?.map((dynamic e) => e as String).toList(),
        roomPrice = (json['room_price'] as List?)?.map((dynamic e) => e as int).toList();

  Map<String, dynamic> toJson() => {
    'room_type' : roomType,
    'room_price' : roomPrice
  };
}