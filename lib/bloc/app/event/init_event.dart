import 'package:blankscreen/bloc/app/event/base/app_base_event.dart';
import 'package:blankscreen/repository/local/database.dart';
import 'package:blankscreen/repository/remote/api_connector.dart';

class InitEvent extends AppBaseEvent {
  const InitEvent({
    required super.state,
    required this.database,
    required this.apiConnector,
  });

  final Database database;
  final ApiConnector apiConnector;
}
