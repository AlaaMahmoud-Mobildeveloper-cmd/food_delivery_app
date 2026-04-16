import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/entities/food_item.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final FoodItem foodItem;
  const AddToCart(this.foodItem);

  @override
  List<Object> get props => [foodItem];
}

class RemoveFromCart extends CartEvent {
  final String foodItemId;
  const RemoveFromCart(this.foodItemId);

  @override
  List<Object> get props => [foodItemId];
}

class UpdateQuantity extends CartEvent {
  final String foodItemId;
  final int quantity;
  const UpdateQuantity(this.foodItemId, this.quantity);

  @override
  List<Object> get props => [foodItemId, quantity];
}

class ClearCart extends CartEvent {}
