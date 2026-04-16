import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_state.dart';
import 'package:food_delivery_app/features/cart/domain/entities/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>((event, emit) {
      final updatedItems = List<CartItem>.from(state.items);
      final index = updatedItems.indexWhere((item) => item.foodItem.id == event.foodItem.id);

      if (index >= 0) {
        updatedItems[index] = updatedItems[index].copyWith(
          quantity: updatedItems[index].quantity + 1,
        );
      } else {
        updatedItems.add(CartItem(foodItem: event.foodItem, quantity: 1));
      }

      emit(state.copyWith(items: updatedItems));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedItems = state.items.where((item) => item.foodItem.id != event.foodItemId).toList();
      emit(state.copyWith(items: updatedItems));
    });

    on<UpdateQuantity>((event, emit) {
      if (event.quantity <= 0) {
        add(RemoveFromCart(event.foodItemId));
        return;
      }

      final updatedItems = List<CartItem>.from(state.items);
      final index = updatedItems.indexWhere((item) => item.foodItem.id == event.foodItemId);

      if (index >= 0) {
        updatedItems[index] = updatedItems[index].copyWith(quantity: event.quantity);
        emit(state.copyWith(items: updatedItems));
      }
    });

    on<ClearCart>((event, emit) {
      emit(const CartState());
    });
  }
}
