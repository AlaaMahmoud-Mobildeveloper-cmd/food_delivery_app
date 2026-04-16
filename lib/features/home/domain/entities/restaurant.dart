import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String cuisine;
  final double rating;
  final int deliveryTime;
  final double deliveryFee;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, cuisine, rating, deliveryTime, deliveryFee];
}
