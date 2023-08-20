import 'dart:convert';

import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/domain/model/base/has_json.dart';
import 'package:blankscreen/domain/model/news_model.dart';
import 'package:http/http.dart' as http;

class ApiConnector {
  /// Singleton ->
  static ApiConnector? _instance;

  ApiConnector._internal({
    required this.config,
  });

  factory ApiConnector({
    required Config config,
  }) {
    _instance ??= ApiConnector._internal(config: config);
    return _instance!;
  }

  final Config config;

  /// Singleton <-

  Future<NewsModel> getNews(HasJson params) async {
    final Uri uri = Uri.https(config.apiAuthority, config.apiPath, params.toJson());

    final http.Response response = await http.get(uri);

    return NewsModel.fromJson(jsonDecode(response.body));
  }
}
