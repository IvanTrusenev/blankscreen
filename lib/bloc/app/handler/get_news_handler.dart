import 'package:blankscreen/bloc/app/app_state.dart';
import 'package:blankscreen/bloc/app/event/get_news_event.dart';
import 'package:blankscreen/bloc/app/model/app_state_enum.dart';
import 'package:blankscreen/domain/mapper/news_mapper.dart';
import 'package:blankscreen/domain/model/get_news_request.dart';
import 'package:blankscreen/domain/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> getNewsHandler(
  GetNewsEvent event,
  Emitter<AppState> emit,
) async {
  // final NewsModel response = await event.apiConnector.getNews(GetNewsRequest.sport(apiKey: event.apiConnector.config.apiKey));
  final NewsModel response = await event.apiConnector.getNewsMock(GetNewsRequest.sport(apiKey: event.apiConnector.config.apiKey));

  await event.database.writeNews(NewsMapper.fromModel(response).entity);

  emit(event.state.copyWith(appStateEnum: AppStateEnum.news));
}
