import 'package:EURB/config/config.dart';
import 'package:EURB/firebase_options.dart';
import 'package:EURB/repository/local/database.dart';
import 'package:EURB/repository/remote/api_connector.dart';
import 'package:EURB/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final Config config = Config();
  await config.init();

  final ApiConnector apiConnector = ApiConnector(config: config);

  final Database database = Database(config: config);
  await database.init();

  runApp(MyApp(
    config: config,
    apiConnector: apiConnector,
    database: database,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.config,
    required this.apiConnector,
    required this.database,
  });

  final Config config;
  final ApiConnector apiConnector;
  final Database database;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: config),
        RepositoryProvider.value(value: apiConnector),
        RepositoryProvider.value(value: database),
      ],
      child: ScreenUtilInit(
        designSize: const Size(480, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
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
            routerConfig: router,
          );
        },
      ),
    );
  }
}
