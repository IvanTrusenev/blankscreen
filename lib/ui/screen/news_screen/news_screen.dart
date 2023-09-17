import 'package:EURB/domain/mapper/news_mapper.dart';
import 'package:EURB/domain/model/news_model.dart';
import 'package:EURB/repository/local/database.dart';
import 'package:EURB/ui/screen/news_screen/widget/news_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsModel news = context.select((Database database) => NewsMapper.fromEntity(database.readNews()).model);
    final List<Widget> articles = news.articles
        .map(
          (article) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 8.w,
            ),
            child: NewsArticle(article: article),
          ),
        )
        .toList(growable: false);

    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Material(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: articles,
            ),
          ),
        ),
      ),
    );
  }
}
