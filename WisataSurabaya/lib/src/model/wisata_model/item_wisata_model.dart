import 'dart:convert';
class Datum {
    final String caption;
    final String description;
    final String thumbnail;
    final String address;
    final double longitude;
    final double latitude;
    final String like;
    final double rating;
    final String image1;
    final String image2;
    final String image3;
    final String image4;
    final String image5;

    Datum({
        this.caption,
        this.description,
        this.thumbnail,
        this.address,
        this.longitude,
        this.latitude,
        this.like,
        this.rating,
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        caption: json["caption"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        address: json["address"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        like: json["like"],
        rating: json["rating"].toDouble(),
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        image5: json["image5"],
    );

    Map<String, dynamic> toJson() => {
        "caption": caption,
        "description": description,
        "thumbnail": thumbnail,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "like": like,
        "rating": rating,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "image5": image5,
    };
}