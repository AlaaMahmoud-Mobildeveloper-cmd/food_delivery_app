import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/di/injection.dart' as di;
import 'package:food_delivery_app/core/theme/app_theme.dart';
import 'package:food_delivery_app/features/home/domain/entities/restaurant.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/bloc/restaurant_bloc.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/bloc/restaurant_event.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/bloc/restaurant_state.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery_app/features/restaurant_details/presentation/widgets/food_card.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant-details';
  final Restaurant restaurant;

  const RestaurantDetailsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RestaurantBloc>()..add(LoadMenu(restaurant.id)),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  restaurant.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      restaurant.cuisine,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.star, color: AppTheme.accentColor, size: 20),
                        const SizedBox(width: 4),
                        Text(restaurant.rating.toString()),
                        const SizedBox(width: 24),
                        const Icon(Icons.access_time, size: 20, color: AppTheme.primaryColor),
                        const SizedBox(width: 4),
                        Text('${restaurant.deliveryTime} mins'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Menu Items",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
                if (state is RestaurantLoading) {
                  return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
                }
                if (state is RestaurantLoaded) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = state.menu[index];
                          return FoodCard(
                            foodItem: item,
                            onAdd: () {
                              context.read<CartBloc>().add(AddToCart(item));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${item.name} added to cart")),
                              );
                            },
                          );
                        },
                        childCount: state.menu.length,
                      ),
                    ),
                  );
                }
                if (state is RestaurantError) {
                  return SliverFillRemaining(child: Center(child: Text(state.message)));
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}
