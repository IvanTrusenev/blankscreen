import 'package:EURB/bloc/app/app_state.dart';

abstract class AppBaseEvent {
  const AppBaseEvent({
    required this.state,
  });

  final AppState state;
}
