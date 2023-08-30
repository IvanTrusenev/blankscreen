import 'package:blankscreen/bloc/news/event/base/news_base_event.dart';
import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/repository/remote/api_connector.dart';

class GetNewsEvent extends NewsBaseEvent {
  const GetNewsEvent({
    required this.apiConnector,
    required this.params,
    required this.config,
  });

  final ApiConnector apiConnector;
  final Map<String, dynamic> params;
  final Config config;
}
