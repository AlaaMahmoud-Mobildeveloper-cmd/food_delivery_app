import 'package:get_it/get_it.dart';
import 'package:food_delivery_app/core/cache/cache_helper.dart';
import 'package:food_delivery_app/features/home/domain/repositories/home_repository.dart';
import 'package:food_delivery_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:food_delivery_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:food_delivery_app/features/home/domain/usecases/get_categories.dart';
import 'package:food_delivery_app/features/home/domain/usecases/get_popular_restaurants.dart';
import 'package:food_delivery_app/features/home/presentation/blocs/home_bloc.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/repositories/restaurant_repository.dart';
import 'package:food_delivery_app/features/restaurant_details/data/repositories/restaurant_repository_impl.dart';
import 'package:food_delivery_app/features/restaurant_details/data/datasources/restaurant_remote_datasource.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/bloc/restaurant_bloc.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_delivery_app/features/auth/data/repositories/auth_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core (CacheHelper)
  await CacheHelper.init();

  // Blocs
  sl.registerFactory(() => HomeBloc(
        getCategories: sl(),
        getPopularRestaurants: sl(),
      ));
  sl.registerFactory(() => RestaurantBloc(repository: sl()));
  sl.registerFactory(() => CartBloc());

  // Use cases
  sl.registerLazySingleton(() => GetCategories(sl()));
  sl.registerLazySingleton(() => GetPopularRestaurants(sl()));

  // Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<RestaurantRepository>(() => RestaurantRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  sl.registerLazySingleton<RestaurantRemoteDataSource>(() => RestaurantRemoteDataSourceImpl());
}
