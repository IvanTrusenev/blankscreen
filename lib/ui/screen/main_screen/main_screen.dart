import 'package:blankscreen/repository/local/database.dart';
import 'package:blankscreen/ui/screen/main_screen/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
            child: WebViewWidget(
              controller: context.read<MainViewModel>().webViewController,
            ),
          );
        },
      ),
    );
  }
}
