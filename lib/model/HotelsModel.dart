class HotelsModel {
  final String? message;
  final List<Hotel>? data;

  HotelsModel({
    this.message,
    this.data,
  });

  HotelsModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Hotel.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Hotel {
  final int? id;
  final String? name;
  final String? location;
  final String? imageUrl;
  final String? reviewScore;
  final String? country;

  Hotel({
    this.id,
    this.name,
    this.location,
    this.imageUrl,
    this.reviewScore,
    this.country,
  });

  Hotel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        location = json['location'] as String?,
        imageUrl = json['image_url'] as String?,
        reviewScore = json['review_score'] as String?,
        country = json['country'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'location' : location,
    'image_url' : imageUrl,
    'review_score' : reviewScore,
    'country' : country
  };
}