import 'package:EURB/bloc/app/app_state.dart';
import 'package:EURB/bloc/app/event/get_remote_config_event.dart';
import 'package:EURB/bloc/app/model/app_state_enum.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> getRemoteConfigHandler(
  GetRemoteConfigEvent event,
  Emitter<AppState> emit,
) async {
  late final String mainUrl;

  try {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    mainUrl = remoteConfig.getString('MainUrl');
  } catch (e) {
    return emit(event.state.copyWith(appStateEnum: AppStateEnum.noInternetConnection));
  }

  if (mainUrl.isEmpty || event.config.isEmu) {
    emit(event.state.copyWith(appStateEnum: AppStateEnum.getNews));
  } else {
    emit(event.state.copyWith(appStateEnum: AppStateEnum.main, mainUrl: mainUrl));
  }
}
