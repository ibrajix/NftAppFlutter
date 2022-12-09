part of 'nft_bloc.dart';

@immutable
abstract class NftEvent extends Equatable {
  const NftEvent();
}

class GetNftEvent extends NftEvent {
  @override
  List<Object?> get props => [];
}

