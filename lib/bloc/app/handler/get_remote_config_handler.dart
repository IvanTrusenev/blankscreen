import 'package:blankscreen/bloc/app/app_state.dart';
import 'package:blankscreen/bloc/app/event/get_remote_config_event.dart';
import 'package:blankscreen/bloc/app/model/app_state_enum.dart';
import 'package:blankscreen/domain/entity/remote_config_entity.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> getRemoteConfigHandler(
  GetRemoteConfigEvent event,
  Emitter<AppState> emit,
) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();

  final String mainUrl = remoteConfig.getString('MainUrl');
  await event.database.writeRemoteConfig(RemoteConfigEntity(mainUrl: mainUrl));

  if (mainUrl.isEmpty || event.config.isEmu) {
    emit(event.state.copyWith(appStateEnum: AppStateEnum.getNews));
  } else {
    emit(event.state.copyWith(appStateEnum: AppStateEnum.main));
  }
}
