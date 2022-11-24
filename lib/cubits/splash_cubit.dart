import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(SplashState(animate: false));

  Future doAnimate() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(SplashState(animate: true));
    await Future.delayed(const Duration(milliseconds: 1500));
  }

}
