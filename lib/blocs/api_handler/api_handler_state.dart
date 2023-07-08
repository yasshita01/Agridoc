part of 'api_handler_bloc.dart';

abstract class ApiHandlerState extends Equatable {
  const ApiHandlerState();

  @override
  List<Object> get props => [];
}

class ApiHandlerInitial extends ApiHandlerState {}

class ApiDataLoaded<T> extends ApiHandlerState {
  final T data;

  const ApiDataLoaded({required this.data});
}

class ApiError extends ApiHandlerState {
  final String message;

  const ApiError({required this.message});
}
