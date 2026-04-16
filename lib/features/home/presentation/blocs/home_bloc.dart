import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/home/domain/usecases/get_categories.dart';
import 'package:food_delivery_app/features/home/domain/usecases/get_popular_restaurants.dart';
import 'package:food_delivery_app/features/home/presentation/blocs/home_event.dart';
import 'package:food_delivery_app/features/home/presentation/blocs/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategories getCategories;
  final GetPopularRestaurants getPopularRestaurants;

  HomeBloc({
    required this.getCategories,
    required this.getPopularRestaurants,
  }) : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        final categories = await getCategories();
        final restaurants = await getPopularRestaurants();
        emit(HomeLoaded(categories: categories, restaurants: restaurants));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
