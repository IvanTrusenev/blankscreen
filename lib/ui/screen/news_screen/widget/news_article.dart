import 'package:blankscreen/domain/model/news_article_model.dart';
import 'package:blankscreen/ui/screen/news_screen/widget/news_article_image.dart';
import 'package:blankscreen/ui/screen/news_screen/widget/news_article_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({
    super.key,
    required this.article,
  });

  final NewsArticleModel article;

  int get imageFlex {
    if (article.urlToImage.isEmpty) {
      return 0;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NewsArticleViewModel(article: article),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return InkWell(
            // onTap: () => context.read<NewsArticleViewModel>().showNewsArticle(context),
            onTap: () => context.read<NewsArticleViewModel>().showNewsArticle2(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          article.source.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          article.publishedAt.substring(0, 10),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Text(article.title),
                          ),
                        ),
                        Expanded(
                          flex: imageFlex,
                          child: NewsArticleImage(imageUrl: article.urlToImage),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
