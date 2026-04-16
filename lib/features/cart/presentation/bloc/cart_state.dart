import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/cart/domain/entities/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  double get totalPrice => items.fold(0, (total, item) => total + (item.foodItem.price * item.quantity));
  int get totalItems => items.fold(0, (total, item) => total + item.quantity);

  @override
  List<Object?> get props => [items];

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }
}
