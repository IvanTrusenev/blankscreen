import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModel({
    required this.mainUrl,
  });

  final String mainUrl;
  InAppWebViewController? _webViewController;

  /// Progress ->
  int _progress = 100;

  int get progress => _progress;

  /// Progress <-

  Uri? get mainUri => Uri.tryParse(mainUrl);

  void setWebViewController(InAppWebViewController controller) => _webViewController = controller;

  void setProgress(InAppWebViewController controller, int progress) {
    _progress = progress;
    notifyListeners();
  }

  Future<bool> onBackPressed() async {
    if (_webViewController == null) return false;

    final bool canGoBack = await _webViewController!.canGoBack();
    if (canGoBack) _webViewController!.goBack();

    return false;
  }
}
