import 'dart:convert';
import 'dart:io';

import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/domain/model/base/has_json.dart';
import 'package:blankscreen/domain/model/news_model.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class ApiConnector {
  /// Singleton ->
  static ApiConnector? _instance;

  ApiConnector._internal({
    required this.httpClient,
    required this.config,
  });

  factory ApiConnector({
    required HttpClient httpClient,
    required Config config,
  }) {
    return _instance ??= ApiConnector._internal(
      httpClient: httpClient,
      config: config,
    );
  }

  /// Singleton <-

  final HttpClient httpClient;
  final Config config;
  late final IOClient ioClient;

  void init() {
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    ioClient = IOClient(httpClient);
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup(config.apiAuthority);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<NewsModel> getNews(HasJson params) async {
    final Uri uri = Uri.https(config.apiAuthority, config.apiPath, params.toJson());

    final Response response = await ioClient.get(uri);

    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    }

    return const NewsModel.empty();
  }
}
