import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/repository/remote/api_connector.dart';
import 'package:blankscreen/ui/screen/no_internet_connection/no_internet_connection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  final Config config = Config();
  await config.init();

  final ApiConnector apiConnector = ApiConnector(config: config);

  runApp(MyApp(
    config: config,
    apiConnector: apiConnector,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.config,
    required this.apiConnector,
  });

  final Config config;
  final ApiConnector apiConnector;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: apiConnector,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: const NoInternetConnectionScreen(),
      ),
    );
  }
}
