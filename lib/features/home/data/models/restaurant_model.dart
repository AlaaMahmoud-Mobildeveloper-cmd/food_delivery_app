import 'package:food_delivery_app/features/home/domain/entities/restaurant.dart';

class RestaurantModel extends Restaurant {
  const RestaurantModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.cuisine,
    required super.rating,
    required super.deliveryTime,
    required super.deliveryFee,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      cuisine: json['cuisine'],
      rating: (json['rating'] as num).toDouble(),
      deliveryTime: json['deliveryTime'],
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'cuisine': cuisine,
      'rating': rating,
      'deliveryTime': deliveryTime,
      'deliveryFee': deliveryFee,
    };
  }
}
