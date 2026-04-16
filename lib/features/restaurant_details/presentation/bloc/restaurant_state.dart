import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/entities/food_item.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<FoodItem> menu;

  const RestaurantLoaded(this.menu);

  @override
  List<Object> get props => [menu];
}

class RestaurantError extends RestaurantState {
  final String message;

  const RestaurantError(this.message);

  @override
  List<Object> get props => [message];
}
