import 'package:blankscreen/bloc/news/event/get_news_event.dart';
import 'package:blankscreen/bloc/news/news_bloc.dart';
import 'package:blankscreen/bloc/news/news_state.dart';
import 'package:blankscreen/config/config.dart';
import 'package:blankscreen/repository/remote/api_connector.dart';
import 'package:blankscreen/ui/screen/news_screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiConnector apiConnector = context.read<ApiConnector>();
    final Config config = context.read<Config>();

    return BlocProvider(
      create: (BuildContext context) => NewsBloc(const NewsState.empty())..add(GetNewsEvent(apiConnector: apiConnector, params: {}, config: config)),
      child: const NewsScreen(),
    );
  }
}
