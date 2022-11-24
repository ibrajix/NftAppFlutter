import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_app_flutter/cubits/splash_cubit.dart';
import 'package:nft_app_flutter/navigation/routes.dart';
import 'package:nft_app_flutter/presentation/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  final router = Navigation().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashCubit()),
        ],
        child: Builder(
          builder: ((context) {
            return MaterialApp.router(
                routeInformationParser: router.routeInformationParser,
                routerDelegate: router.routerDelegate,
                routeInformationProvider: router.routeInformationProvider,
                theme: ThemeData(

              ),
            );
          }),
        )
    );
  }
}
