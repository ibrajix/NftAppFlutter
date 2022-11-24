import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nft_app_flutter/cubits/splash_cubit.dart';
import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void didChangeDependencies() async {
    BlocProvider.of<SplashCubit>(context).doAnimate();
    await Future.delayed(const Duration(milliseconds: 3000));
    if (!mounted) return;
    context.go(Destination.welcomeScreen);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BlocBuilder<SplashCubit, SplashState>(
            builder: (context, state) {
              return AnimatedPositioned(
               curve: Curves.fastLinearToSlowEaseIn,
               duration: const Duration(milliseconds: 1600),
               bottom: state.animate ? MediaQuery.of(context).size.height/2 : 0,
               child: Center(
                child: Image.asset(
                  Images.splashImage,
                  height: 50,
                  width: 50,
                ),
               ),
              );
            }
          )
        ],
      ),
    );
  }

}