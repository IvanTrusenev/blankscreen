import 'package:blankscreen/domain/model/news_model.dart';

class NewsState {
  const NewsState({
    required this.news,
  });

  const NewsState.empty()
      : this(
          news: const NewsModel.empty(),
        );

  final NewsModel news;
}
