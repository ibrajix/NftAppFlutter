import 'package:equatable/equatable.dart';

enum Status {
  loading, success, error
}

class ApiState<T> extends Equatable {

  final Status? status;
  final T data;
  final String? error;

  const ApiState({
    required this.data,
    this.status = Status.loading,
    this.error
  });

  factory ApiState.initial(T data) => ApiState(data: data);

  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => error != null && status == Status.error;

  String getError() => error ?? "";

  ApiState copyWith({
    Status? status,
    T? data,
    String? error,
  }) {
    return ApiState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, data, error];

}