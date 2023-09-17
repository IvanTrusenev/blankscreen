import 'package:EURB/bloc/app/app_state.dart';
import 'package:EURB/bloc/app/event/get_news_event.dart';
import 'package:EURB/bloc/app/model/app_state_enum.dart';
import 'package:EURB/domain/mapper/news_mapper.dart';
import 'package:EURB/domain/model/get_news_request.dart';
import 'package:EURB/domain/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> getNewsHandler(
  GetNewsEvent event,
  Emitter<AppState> emit,
) async {
  final NewsModel response = await event.apiConnector.getNewsMock(GetNewsRequest.sport(apiKey: event.apiConnector.config.apiKey));

  await event.database.writeNews(NewsMapper.fromModel(response).entity);

  emit(event.state.copyWith(appStateEnum: AppStateEnum.news));
}
