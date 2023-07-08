import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_handler_event.dart';
part 'api_handler_state.dart';

class ApiHandlerBloc extends Bloc<ApiHandlerEvent, ApiHandlerState> {
  ApiHandlerBloc() : super(ApiHandlerInitial()) {
    on<ApiHandlerEvent>((event, emit) async {
      emit(ApiHandlerInitial());

      if (event is ApiFetch) {
        try {
          var data = await event.fetch();
          emit(ApiDataLoaded(data: data));
        } catch (e) {
          emit(ApiError(message: e.toString()));
        }
      }
    });
  }
}
