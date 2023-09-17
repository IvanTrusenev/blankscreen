import 'package:EURB/bloc/app/event/base/app_base_event.dart';
import 'package:EURB/repository/local/database.dart';
import 'package:EURB/repository/remote/api_connector.dart';

class GetNewsEvent extends AppBaseEvent {
  const GetNewsEvent({
    required super.state,
    required this.apiConnector,
    required this.database,
  });

  final ApiConnector apiConnector;
  final Database database;
}
