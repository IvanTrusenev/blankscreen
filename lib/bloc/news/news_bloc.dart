import 'package:blankscreen/bloc/news/event/base/news_base_event.dart';
import 'package:blankscreen/bloc/news/event/get_news_event.dart';
import 'package:blankscreen/bloc/news/handler/get_news_handler.dart';
import 'package:blankscreen/bloc/news/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsBaseEvent, NewsState> {
  NewsBloc(super.initialState) {
    on<GetNewsEvent>(getNewsHandler);
  }
}
