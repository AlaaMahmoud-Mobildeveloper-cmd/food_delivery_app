import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/home/domain/entities/category.dart';
import 'package:food_delivery_app/features/home/domain/entities/restaurant.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Category> categories;
  final List<Restaurant> restaurants;

  const HomeLoaded({required this.categories, required this.restaurants});

  @override
  List<Object> get props => [categories, restaurants];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
