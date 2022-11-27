import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_app_flutter/navigation/routes.dart';
import 'package:nft_app_flutter/repository/nft_repository.dart';

import '../state/bloc/nft_bloc.dart';
import '../state/cubits/splash_cubit.dart';
import '../theme/app_theme.dart';

void main() {

  const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  runApp(
      MyApp()
  );

}

class MyApp extends StatelessWidget {

  MyApp({
    Key? key,
  }) : super(key: key);

  final router = Navigation().router;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => NftRepository()
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SplashCubit()),
            BlocProvider(create: (context) => NftBloc(RepositoryProvider.of<NftRepository>(context))..add(GetNftEvent()))
          ],
          child: Builder(
            builder: ((context){
              return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  routeInformationProvider: router.routeInformationProvider,
                  theme: lightThemeData
              );
            }
          ),
        ))
    );
  }
}
