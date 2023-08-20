import 'package:blankscreen/bloc/news/event/base/news_base_event.dart';
import 'package:blankscreen/repository/remote/api_connector.dart';

class GetNewsEvent extends NewsBaseEvent {
  const GetNewsEvent({
    required this.apiConnector,
    required this.params,
  });

  final ApiConnector apiConnector;
  final Map<String, dynamic> params;
}
