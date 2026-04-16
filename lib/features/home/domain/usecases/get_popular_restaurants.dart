import 'package:food_delivery_app/features/home/domain/entities/restaurant.dart';
import 'package:food_delivery_app/features/home/domain/repositories/home_repository.dart';

class GetPopularRestaurants {
  final HomeRepository repository;

  GetPopularRestaurants(this.repository);

  Future<List<Restaurant>> call() async {
    return await repository.getPopularRestaurants();
  }
}
