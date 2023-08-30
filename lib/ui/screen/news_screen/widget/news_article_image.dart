import 'package:flutter/material.dart';

class NewsArticleImage extends StatelessWidget {
  const NewsArticleImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
      fit: BoxFit.fitWidth,
      errorBuilder: (context, object, stacktrace) => const SizedBox.shrink(),
    );
  }
}
