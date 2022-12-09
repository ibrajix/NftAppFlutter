import 'package:equatable/equatable.dart';

enum Status {
  loading, success, error
}

class ApiState<T> extends Equatable {

  final Status? status;
  final T topNft;
  final T trendingNft;
  final String? error;

  const ApiState({
    required this.topNft,
    required this.trendingNft,
    this.status = Status.loading,
    this.error
  });

  factory ApiState.initial(T topNft, T trendingNft) => ApiState(topNft: topNft, trendingNft: trendingNft);

  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => error != null && status == Status.error;

  String getError() => error ?? "";

  ApiState copyWith({
    Status? status,
    T? topNft,
    T? trendingNft,
    String? error,
  }) {
    return ApiState(
      status: status ?? this.status,
      topNft: topNft ?? this.topNft,
      trendingNft: trendingNft ??  this.trendingNft,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, topNft, trendingNft, error];

}