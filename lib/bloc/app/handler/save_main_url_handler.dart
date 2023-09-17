import 'package:EURB/bloc/app/app_state.dart';
import 'package:EURB/bloc/app/event/save_main_url_event.dart';
import 'package:EURB/domain/entity/remote_config_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> saveMainUrlHandler(
  SaveMainUrlEvent event,
  Emitter<AppState> emit,
) async {
  await event.database.writeRemoteConfig(RemoteConfigEntity(mainUrl: event.state.mainUrl));
}
