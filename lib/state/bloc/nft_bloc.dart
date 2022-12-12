

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:nft_app_flutter/state/bloc/api_state.dart';
import 'package:nft_app_flutter/model/TrendingNft.dart';

import '../../model/TopNft.dart';
import '../../repository/nft_repository.dart';
import '../../utils/constants.dart';
part 'nft_event.dart';


class NftBloc extends Bloc<NftEvent, ApiState> {

  final NftRepository _nftRepository;

  NftBloc(this._nftRepository) : super(ApiState.initial(const [], const [])) {

    on<GetNftEvent>((event, emit) async {
      emit(state.copyWith(
        status: Status.loading
      ));
      try{
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
          //connected, fire request
          final allNft = await _nftRepository.getAllNft();
          final topNft = List<TopNft>.from(allNft[0].map((i) => TopNft.fromJson(i)));
          final trendingNft = List<TrendingNft>.from(allNft[1].map((i) => TrendingNft.fromJson(i)));
          emit(state.copyWith(
              status: Status.success,
              topNft: topNft,
              trendingNft: trendingNft
          ));
        } else {
          //not connected, show error message
          emit(state.copyWith(
              status: Status.error,
              error: Strings.noInternetConnection
          ));
        }
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
