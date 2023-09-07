import 'package:blankscreen/bloc/app/app_state.dart';
import 'package:blankscreen/bloc/app/event/base/app_base_event.dart';
import 'package:blankscreen/bloc/app/event/get_news_event.dart';
import 'package:blankscreen/bloc/app/event/get_remote_config_event.dart';
import 'package:blankscreen/bloc/app/event/init_event.dart';
import 'package:blankscreen/bloc/app/event/start_event.dart';
import 'package:blankscreen/bloc/app/handler/get_news_handler.dart';
import 'package:blankscreen/bloc/app/handler/get_remote_config_handler.dart';
import 'package:blankscreen/bloc/app/handler/init_handler.dart';
import 'package:blankscreen/bloc/app/handler/start_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppBaseEvent, AppState> {
  AppBloc(super.initialState) {
    on<GetNewsEvent>(getNewsHandler);
    on<GetRemoteConfigEvent>(getRemoteConfigHandler);
    on<InitEvent>(initHandler);
    on<StartEvent>(startHandler);
  }
}
