import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/cache/cache_helper.dart';
import 'package:food_delivery_app/core/di/injection.dart' as di;
import 'package:food_delivery_app/core/theme/app_theme.dart';
import 'package:food_delivery_app/features/auth/presentation/screens/login_screen.dart';
import 'package:food_delivery_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:food_delivery_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:food_delivery_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:food_delivery_app/features/home/presentation/blocs/home_bloc.dart';
import 'package:food_delivery_app/features/home/presentation/screens/home_screen.dart';
import 'package:food_delivery_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:food_delivery_app/features/onboarding/presentation/screens/splash_screen.dart';

void main() async {
  // Ensure Flutter bindings are initialized before di.init()
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Dependency Injection
  await di.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Providing global Blocs (Home and Cart) to the entire app
      providers: [
        BlocProvider(create: (_) => di.sl<HomeBloc>()),
        BlocProvider(create: (_) => di.sl<CartBloc>()),
      ],
      child: MaterialApp(
        title: 'FoodDash',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute:SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          OnboardingScreen.routeName: (context) => const OnboardingScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          CheckoutScreen.routeName: (context) => const CheckoutScreen(),
        },
      ),
    );
  }
}
