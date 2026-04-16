import 'package:food_delivery_app/features/restaurant_details/domain/entities/food_item.dart';

abstract class RestaurantRepository {
  Future<List<FoodItem>> getMenu(String restaurantId);
}
