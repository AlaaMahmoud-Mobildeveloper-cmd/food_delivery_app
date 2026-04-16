import 'package:food_delivery_app/features/restaurant_details/data/datasources/restaurant_remote_datasource.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/entities/food_item.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<FoodItem>> getMenu(String restaurantId) async {
    return await remoteDataSource.getMenu(restaurantId);
  }
}
