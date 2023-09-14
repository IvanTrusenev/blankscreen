import 'package:flutter/material.dart';

class NewsArticleImage extends StatelessWidget {
  const NewsArticleImage({
    super.key,
    required this.assetImage,
  });

  final String assetImage;

  @override
  Widget build(BuildContext context) {
    if (assetImage.isEmpty) {
      return const SizedBox.shrink();
    }

    return Image(
      image: AssetImage(assetImage),
      fit: BoxFit.fitWidth,
      errorBuilder: (context, object, stacktrace) => const SizedBox.shrink(),
    );
  }
}
