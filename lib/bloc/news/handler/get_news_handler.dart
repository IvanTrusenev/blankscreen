import 'package:blankscreen/bloc/news/event/get_news_event.dart';
import 'package:blankscreen/bloc/news/news_state.dart';
import 'package:blankscreen/domain/model/get_news_request.dart';
import 'package:blankscreen/domain/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> getNewsHandler(
  GetNewsEvent event,
  Emitter<NewsState> emit,
) async {
  final NewsModel response = await event.apiConnector.getNews(GetNewsRequest.sport(apiKey: event.config.apiKey));

  emit(NewsState(news: response));
}
