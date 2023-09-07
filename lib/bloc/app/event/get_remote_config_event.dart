import 'package:blankscreen/bloc/app/event/base/app_base_event.dart';
import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/repository/local/database.dart';

class GetRemoteConfigEvent extends AppBaseEvent {
  const GetRemoteConfigEvent({
    required super.state,
    required this.database,
    required this.config,
  });

  final Database database;
  final Config config;
}
