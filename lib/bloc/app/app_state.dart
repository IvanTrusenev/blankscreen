import 'package:blankscreen/bloc/app/model/app_state_enum.dart';

class AppState {
  const AppState({
    required this.appStateEnum,
  });

  const AppState.initial()
      : this(
          appStateEnum: AppStateEnum.initial,
        );

  final AppStateEnum appStateEnum;

  AppState copyWith({
    AppStateEnum? appStateEnum,
  }) {
    return AppState(
      appStateEnum: appStateEnum ?? this.appStateEnum,
    );
  }
}
