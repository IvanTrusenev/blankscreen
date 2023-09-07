import 'package:blankscreen/bloc/app/app_bloc.dart';
import 'package:blankscreen/bloc/app/app_state.dart';
import 'package:blankscreen/bloc/app/event/get_news_event.dart';
import 'package:blankscreen/bloc/app/event/get_remote_config_event.dart';
import 'package:blankscreen/bloc/app/event/init_event.dart';
import 'package:blankscreen/bloc/app/event/start_event.dart';
import 'package:blankscreen/bloc/app/model/app_state_enum.dart';
import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/repository/local/database.dart';
import 'package:blankscreen/repository/remote/api_connector.dart';
import 'package:blankscreen/ui/screen/main_screen/main_screen.dart';
import 'package:blankscreen/ui/screen/news_screen/news_screen.dart';
import 'package:blankscreen/ui/screen/no_internet_connection/no_internet_connection_screen.dart';
import 'package:blankscreen/ui/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc(const AppState.initial()),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (BuildContext context, AppState state) {
          final AppBloc appBloc = context.read<AppBloc>();
          final Database database = context.read<Database>();
          final ApiConnector apiConnector = context.read<ApiConnector>();
          final Config config = context.read<Config>();

          switch (state.appStateEnum) {
            case AppStateEnum.splash:
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await Future.delayed(const Duration(seconds: 3), () {
                  appBloc.add(InitEvent(
                    state: state,
                    database: database,
                    apiConnector: apiConnector,
                  ));
                });
              });
              break;

            case AppStateEnum.getRemoteConfig:
              appBloc.add(GetRemoteConfigEvent(
                state: state,
                database: database,
                config: config,
              ));
              break;

            case AppStateEnum.getNews:
              appBloc.add(GetNewsEvent(
                state: state,
                apiConnector: apiConnector,
                database: database,
              ));
              break;

            default:
          }
        },
        listenWhen: (prevState, curState) => [
          AppStateEnum.splash,
          AppStateEnum.getRemoteConfig,
          AppStateEnum.getNews,
        ].contains(curState.appStateEnum),
        builder: (BuildContext context, AppState state) {
          if (state.appStateEnum == AppStateEnum.initial) {
            final AppBloc appBloc = context.read<AppBloc>();
            WidgetsBinding.instance.addPostFrameCallback((_) async => appBloc.add(StartEvent(state: state)));
          }

          switch (state.appStateEnum) {
            case AppStateEnum.news:
              return const NewsScreen();

            case AppStateEnum.noInternetConnection:
              return const NoInternetConnectionScreen();

            case AppStateEnum.main:
              return const MainScreen();

            default:
              return const SplashScreen();
          }
        },
        buildWhen: (prevState, curState) => [
          AppStateEnum.initial,
          AppStateEnum.splash,
          AppStateEnum.news,
          AppStateEnum.noInternetConnection,
          AppStateEnum.main,
        ].contains(curState.appStateEnum),
      ),
    );
  }
}
