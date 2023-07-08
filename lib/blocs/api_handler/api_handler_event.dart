part of 'api_handler_bloc.dart';

abstract class ApiHandlerEvent extends Equatable {
  const ApiHandlerEvent();

  @override
  List<Object> get props => [];
}

class ApiFetch<T> extends ApiHandlerEvent {
  final Function fetch;

  const ApiFetch({required this.fetch});
}
