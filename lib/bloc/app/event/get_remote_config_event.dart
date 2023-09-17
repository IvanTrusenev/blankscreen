import 'package:EURB/bloc/app/event/base/app_base_event.dart';
import 'package:EURB/config/config.dart';
import 'package:EURB/repository/local/database.dart';

class GetRemoteConfigEvent extends AppBaseEvent {
  const GetRemoteConfigEvent({
    required super.state,
    required this.database,
    required this.config,
  });

  final Database database;
  final Config config;
}
