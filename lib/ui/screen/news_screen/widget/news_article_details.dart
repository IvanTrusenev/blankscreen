import 'package:EURB/domain/model/news_article_model.dart';
import 'package:EURB/ui/screen/news_screen/widget/news_article_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsArticleDetails extends StatelessWidget {
  const NewsArticleDetails({
    super.key,
    required this.article,
  });

  final NewsArticleModel article;

  @override
  Widget build(BuildContext context) {
    final String description = article.description.isEmpty ? article.title : article.description;

    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Material(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Center(child: _NewsImage(assetImage: article.assetImage)),
                  SizedBox(height: 4.h),
                  Text(description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NewsImage extends StatelessWidget {
  const _NewsImage({
    required this.assetImage,
  });

  final String assetImage;

  @override
  Widget build(BuildContext context) {
    if (assetImage.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 200.h,
      child: NewsArticleImage(assetImage: assetImage),
    );
  }
}
