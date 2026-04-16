import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/theme/app_theme.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_state.dart';
import 'package:food_delivery_app/features/checkout/presentation/screens/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    "Your cart is empty",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 200,
                    child: CustomButton(
                      text: "Go Shopping",
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: state.items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: AppTheme.softShadow,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              item.foodItem.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.foodItem.name,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$${item.foodItem.price}",
                                  style: const TextStyle(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => context.read<CartBloc>().add(
                                      UpdateQuantity(item.foodItem.id, item.quantity - 1),
                                    ),
                              ),
                              Text(item.quantity.toString(), style: Theme.of(context).textTheme.titleMedium),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => context.read<CartBloc>().add(
                                      UpdateQuantity(item.foodItem.id, item.quantity + 1),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: Theme.of(context).textTheme.titleLarge),
                        Text(
                          "\$${state.totalPrice.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppTheme.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: "Checkout",
                      onPressed: () => Navigator.pushNamed(context, CheckoutScreen.routeName),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
