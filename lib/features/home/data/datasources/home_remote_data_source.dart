import 'package:food_delivery_app/features/home/data/models/restaurant_model.dart';
import 'package:food_delivery_app/features/home/domain/entities/category.dart';

abstract class HomeRemoteDataSource {
  Future<List<Category>> getCategories();
  Future<List<RestaurantModel>> getPopularRestaurants();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      Category(id: '1', name: 'Burger', iconUrl: '🍔'),
      Category(id: '2', name: 'Pizza', iconUrl: '🍕'),
      Category(id: '3', name: 'Sushi', iconUrl: '🍣'),
      Category(id: '4', name: 'Dessert', iconUrl: '🍰'),
      Category(id: '5', name: 'Drink', iconUrl: '🥤'),
    ];
  }

  @override
  Future<List<RestaurantModel>> getPopularRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      RestaurantModel(
        id: 'r1',
        name: 'Burger King',
        imageUrl: 'https://images.unsplash.com/photo-1571091718767-18b5b1457add',
        cuisine: 'American • Burgers',
        rating: 4.5,
        deliveryTime: 25,
        deliveryFee: 1.5,
      ),
      RestaurantModel(
        id: 'r2',
        name: 'Pizza Hut',
        imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591',
        cuisine: 'Italian • Pizza',
        rating: 4.2,
        deliveryTime: 35,
        deliveryFee: 2.0,
      ),
      RestaurantModel(
        id: 'r3',
        name: 'Sushi Zen',
        imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
        cuisine: 'Japanese • Sushi',
        rating: 4.8,
        deliveryTime: 40,
        deliveryFee: 3.5,
      ),
    ];
  }
}
