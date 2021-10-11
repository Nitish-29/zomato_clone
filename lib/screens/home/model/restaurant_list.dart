// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class Restaurants {
  Restaurants({
    required this.resultsFound,
    required this.restaurants,
  });

  int resultsFound;
  List<RestaurantElement> restaurants;
}

class RestaurantElement {
  RestaurantElement({
    required this.restaurant,
  });

  RestaurantRestaurant restaurant;
}

class RestaurantRestaurant {
  RestaurantRestaurant({
    required this.hasOnlineDelivery,
    required this.photosUrl,
    required this.url,
    required this.priceRange,
    required this.apikey,
    this.userRating,
    required this.name,
    required this.cuisines,
    required this.isDeliveringNow,
    required this.deeplink,
    required this.menuUrl,
    required this.averageCostForTwo,
    required this.bookUrl,
    required this.switchToOrderMenu,
    required this.hasTableBooking,
    this.location,
    required this.featuredImage,
    required this.currency,
    required this.id,
    required this.thumb,
    required this.eventsUrl,
  });

  int hasOnlineDelivery;
  String photosUrl;
  String url;
  int priceRange;
  String apikey;
  UserRating? userRating;
  String name;
  String cuisines;
  int isDeliveringNow;
  String deeplink;
  String menuUrl;
  int averageCostForTwo;
  String bookUrl;
  int switchToOrderMenu;
  int hasTableBooking;
  Location? location;
  String featuredImage;
  String currency;
  String id;
  String thumb;
  String eventsUrl;

  factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) =>
      RestaurantRestaurant(
        hasOnlineDelivery: json["has_online_delivery"] != null
            ? json["has_online_delivery"] as int
            : 0,
        photosUrl:
            json["photos_url"] != null ? json["photos_url"] as String : "",
        url: json["url"] != null ? json["url"] as String : "",
        priceRange:
            json["price_range"] != null ? json["price_range"] as int : 0,
        apikey: json["apikey"] != null ? json["apikey"] as String : "",
        userRating: json["user_rating"] != null
            ? UserRating.fromJson(json["user_rating"] as Map<String, dynamic>)
            : null,
        name: json["name"] != null ? json["name"] as String : "",
        cuisines: json["cuisines"] != null ? json["cuisines"] as String : "",
        isDeliveringNow: json["is_delivering_now"] != null
            ? json["is_delivering_now"] as int
            : 0,
        deeplink: json["deeplink"] != null ? json["deeplink"] as String : "",
        menuUrl: json["menu_url"] != null ? json["menu_url"] as String : "",
        averageCostForTwo: json["average_cost_for_two"] != null
            ? json["average_cost_for_two"] as int
            : 0,
        bookUrl: json["book_url"] != null ? json["book_url"] as String : "",
        switchToOrderMenu: json["switch_to_order_menu"] != null
            ? json["switch_to_order_menu"] as int
            : 0,
        hasTableBooking: json["has_table_booking"] != null
            ? json["has_table_booking"] as int
            : 0,
        location: json["location"] != null
            ? Location.fromJson(json["location"] as Map<String, dynamic>)
            : null,
        featuredImage: json["featured_image"] != null
            ? json["featured_image"] as String
            : "",
        currency: json["currency"] != null ? json["currency"] as String : "",
        id: json["id"] != null ? json["id"] as String : "",
        thumb: json["thumb"] != null ? json["thumb"] as String : "",
        eventsUrl:
            json["events_url"] != null ? json["events_url"] as String : "",
      );

  Map<String, dynamic> toJson() => {
        "has_online_delivery": hasOnlineDelivery,
        "photos_url": photosUrl,
        "url": url,
        "price_range": priceRange,
        "apikey": apikey,
        "user_rating": userRating?.toJson(),
        "name": name,
        "cuisines": cuisines,
        "is_delivering_now": isDeliveringNow,
        "deeplink": deeplink,
        "menu_url": menuUrl,
        "average_cost_for_two": averageCostForTwo,
        "book_url": bookUrl,
        "switch_to_order_menu": switchToOrderMenu,
        "has_table_booking": hasTableBooking,
        "location": location?.toJson(),
        "featured_image": featuredImage,
        "currency": currency,
        "id": id,
        "thumb": thumb,
        "events_url": eventsUrl,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.address,
    required this.city,
    required this.countryId,
    required this.localityVerbose,
    required this.cityId,
    required this.zipcode,
    required this.longitude,
    required this.locality,
  });

  String latitude;
  String address;
  String city;
  int countryId;
  String localityVerbose;
  int cityId;
  String zipcode;
  String longitude;
  String locality;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"] as String,
        address: json["address"] as String,
        city: json["city"] as String,
        countryId: json["country_id"] as int,
        localityVerbose: json["locality_verbose"] as String,
        cityId: json["city_id"] as int,
        zipcode: json["zipcode"] as String,
        longitude: json["longitude"] as String,
        locality: json["locality"] as String,
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "address": address,
        "city": city,
        "country_id": countryId,
        "locality_verbose": localityVerbose,
        "city_id": cityId,
        "zipcode": zipcode,
        "longitude": longitude,
        "locality": locality,
      };
}

class UserRating {
  UserRating({
    required this.ratingText,
    required this.ratingColor,
    required this.votes,
    required this.aggregateRating,
  });

  String ratingText;
  String ratingColor;
  String votes;
  String aggregateRating;

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
        ratingText: json["rating_text"] as String,
        ratingColor: json["rating_color"] as String,
        votes: json["votes"] as String,
        aggregateRating: json["aggregate_rating"] as String,
      );

  Map<String, dynamic> toJson() => {
        "rating_text": ratingText,
        "rating_color": ratingColor,
        "votes": votes,
        "aggregate_rating": aggregateRating,
      };
}
