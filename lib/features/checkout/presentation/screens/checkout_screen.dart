import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/theme/app_theme.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery_app/features/home/presentation/screens/home_screen.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery Address", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter your address",
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),
            const SizedBox(height: 32),
            Text("Payment Method", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.credit_card, color: AppTheme.primaryColor),
              title: const Text("Credit Card"),
              trailing: const Icon(Icons.check_circle, color: AppTheme.primaryColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              tileColor: AppTheme.secondaryColor.withOpacity(0.1),
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: "Place Order",
              onPressed: () {
                context.read<CartBloc>().add(ClearCart());
                _showSuccessDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Success!"),
        content: const Text("Your order has been placed successfully."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: const Text("Back to Home"),
          ),
        ],
      ),
    );
  }
}
