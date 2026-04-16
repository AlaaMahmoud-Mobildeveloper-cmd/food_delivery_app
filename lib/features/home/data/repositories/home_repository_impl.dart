import 'package:food_delivery_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:food_delivery_app/features/home/domain/entities/category.dart';
import 'package:food_delivery_app/features/home/domain/entities/restaurant.dart';
import 'package:food_delivery_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    return await remoteDataSource.getCategories();
  }

  @override
  Future<List<Restaurant>> getPopularRestaurants() async {
    return await remoteDataSource.getPopularRestaurants();
  }
}
