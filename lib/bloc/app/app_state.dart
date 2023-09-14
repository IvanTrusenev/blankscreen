import 'package:blankscreen/bloc/app/model/app_state_enum.dart';

class AppState {
  const AppState({
    required this.appStateEnum,
    required this.mainUrl,
  });

  const AppState.initial()
      : this(
          appStateEnum: AppStateEnum.initial,
          mainUrl: '',
        );

  final AppStateEnum appStateEnum;
  final String mainUrl;

  AppState copyWith({
    AppStateEnum? appStateEnum,
    String? mainUrl,
  }) {
    return AppState(
      appStateEnum: appStateEnum ?? this.appStateEnum,
      mainUrl: mainUrl ?? this.mainUrl,
    );
  }
}
