import 'package:food_delivery_app/features/restaurant_details/data/models/food_item_model.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<FoodItemModel>> getMenu(String restaurantId);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  @override
  Future<List<FoodItemModel>> getMenu(String restaurantId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      FoodItemModel(
        id: 'f1',
        name: 'Whopper Burger',
        description: 'Flame-grilled beef patty with juicy tomatoes and fresh lettuce.',
        price: 9.99,
        imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
        categoryId: '1',
        rating: 4.5,
      ),
      FoodItemModel(
        id: 'f2',
        name: 'Cheeseburger',
        description: 'Classic cheeseburger with melted cheddar.',
        price: 7.49,
        imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349',
        categoryId: '1',
        rating: 4.3,
      ),
      FoodItemModel(
        id: 'f3',
        name: 'Bacon King',
        description: 'Two flame-grilled beef patties with thick-cut smoked bacon.',
        price: 11.99,
        imageUrl: 'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5',
        categoryId: '1',
        rating: 4.8,
      ),
    ];
  }
}
