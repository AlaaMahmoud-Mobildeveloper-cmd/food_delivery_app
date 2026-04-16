import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/restaurant_details/domain/entities/food_item.dart';

class CartItem extends Equatable {
  final FoodItem foodItem;
  final int quantity;

  const CartItem({required this.foodItem, required this.quantity});

  @override
  List<Object?> get props => [foodItem, quantity];

  CartItem copyWith({int? quantity}) {
    return CartItem(
      foodItem: foodItem,
      quantity: quantity ?? this.quantity,
    );
  }
}
