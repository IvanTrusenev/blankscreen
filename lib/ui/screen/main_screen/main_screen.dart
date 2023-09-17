import 'package:EURB/repository/local/database.dart';
import 'package:EURB/ui/screen/main_screen/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        final String mainUrl = context.read<Database>().readRemoteConfig().mainUrl;
        return MainViewModel(mainUrl: mainUrl);
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
            child: WillPopScope(
              onWillPop: context.read<MainViewModel>().onBackPressed,
              child: const Stack(
                children: <Widget>[
                  _WebView(),
                  _ProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WebView extends StatelessWidget {
  const _WebView();

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: context.read<MainViewModel>().mainUri),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          javaScriptCanOpenWindowsAutomatically: true,
          supportZoom: false,
        ),
      ),
      onWebViewCreated: context.read<MainViewModel>().setWebViewController,
      onProgressChanged: context.read<MainViewModel>().setProgress,
      onCreateWindow: (controller, createWindowRequest) async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.7,
                child: InAppWebView(
                  windowId: createWindowRequest.windowId,
                  initialOptions: InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
                  onWebViewCreated: context.read<MainViewModel>().setWebViewController,
                ),
              ),
            );
          },
        );
        return true;
      },
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final double progress = context.read<MainViewModel>().progress / 100;

    if (progress < 1.0) {
      return Center(
        child: CircularProgressIndicator(
          value: progress,
          color: const Color.fromARGB(255, 0, 167, 251),
          strokeWidth: 3,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
