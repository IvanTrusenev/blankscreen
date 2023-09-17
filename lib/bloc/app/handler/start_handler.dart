import 'package:EURB/bloc/app/app_state.dart';
import 'package:EURB/bloc/app/event/start_event.dart';
import 'package:EURB/bloc/app/model/app_state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> startHandler(
  StartEvent event,
  Emitter<AppState> emit,
) async {
  emit(event.state.copyWith(appStateEnum: AppStateEnum.splash));
}
