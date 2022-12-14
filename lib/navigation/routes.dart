import 'package:go_router/go_router.dart';
import 'package:nft_app_flutter/presentation/home.dart';
import 'package:nft_app_flutter/presentation/splash_screen.dart';
import 'package:nft_app_flutter/presentation/welcome_screen.dart';

import '../utils/constants.dart';

class Navigation {
  final GoRouter router = GoRouter(
      routes: [
        GoRoute(
            path: Destination.splashScreen,
            builder: (context, state) => const SplashScreen()
        ),
        GoRoute(
            path: Destination.welcomeScreen,
            builder: (context, state) => const WelcomeScreen()
        ),
        GoRoute(
            path: Destination.homeScreen,
            builder: (context, state) => const HomeScreen()
        ),
      ]
  );
}