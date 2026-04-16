import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/repositories/restaurant_repository.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/bloc/restaurant_event.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/bloc/restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository repository;

  RestaurantBloc({required this.repository}) : super(RestaurantInitial()) {
    on<LoadMenu>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final menu = await repository.getMenu(event.restaurantId);
        emit(RestaurantLoaded(menu));
      } catch (e) {
        emit(RestaurantError(e.toString()));
      }
    });
  }
}
