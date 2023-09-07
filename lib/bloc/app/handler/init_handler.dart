import 'package:blankscreen/bloc/app/app_state.dart';
import 'package:blankscreen/bloc/app/event/init_event.dart';
import 'package:blankscreen/bloc/app/model/app_state_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> initHandler(
  InitEvent event,
  Emitter<AppState> emit,
) async {
  final String mainUrl = event.database.readRemoteConfig().mainUrl;

  if (mainUrl.isEmpty) {
    emit(event.state.copyWith(appStateEnum: AppStateEnum.getRemoteConfig));
  } else {
    if (await event.apiConnector.hasNetwork()) {
      emit(event.state.copyWith(appStateEnum: AppStateEnum.main));
    } else {
      emit(event.state.copyWith(appStateEnum: AppStateEnum.noInternetConnection));
    }
  }
}
