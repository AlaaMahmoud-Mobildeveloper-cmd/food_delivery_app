import 'package:food_delivery_app/features/home/domain/entities/category.dart';
import 'package:food_delivery_app/features/home/domain/entities/restaurant.dart';

/// Repository interface for Home feature.
/// Defines the contract for fetching home-related data.
abstract class HomeRepository {
  Future<List<Category>> getCategories();
  Future<List<Restaurant>> getPopularRestaurants();
}
