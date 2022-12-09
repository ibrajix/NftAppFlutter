
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nft_app_flutter/state/bloc/api_state.dart';
import 'package:nft_app_flutter/model/TrendingNft.dart';

import '../../model/TopNft.dart';
import '../../repository/nft_repository.dart';

part 'nft_event.dart';

class NftBloc extends Bloc<NftEvent, ApiState> {

  final NftRepository _nftRepository;

  NftBloc(this._nftRepository) : super(ApiState.initial(const [], const [])) {

    on<GetNftEvent>((event, emit) async {
      emit(state.copyWith(
        status: Status.loading
      ));
      try{
        final allNft = await _nftRepository.getAllNft();
        final topNft = List<TopNft>.from(allNft[0].map((i) => TopNft.fromJson(i)));
        final trendingNft = List<TrendingNft>.from(allNft[1].map((i) => TrendingNft.fromJson(i)));
        emit(state.copyWith(
          status: Status.success,
          topNft: topNft,
          trendingNft: trendingNft
        ));
      }catch(e){
        emit(state.copyWith(
          status: Status.error,
          error: e.toString()
        ));
        debugPrint("hello: $e");
      }
    });

  }

}
