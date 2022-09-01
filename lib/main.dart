import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'cubit/fact_cubit.dart';
import 'cubit/history_cubit.dart';
import 'pages/facts_list_page.dart';
import 'pages/show_fact_page.dart';

import 'repositories/facts_repositories.dart';
import 'services/api/api_service.dart';
import 'services/api/storage/fact_entity.dart';
import 'services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(FactEntityAdapter());

  final apiService = ApiService(Dio());

  final historyCubit = HistoryCubit(FactsRepository())..loadHistory();

  runApp(
    MultiProvider(
      providers: [
        BlocProvider.value(value: historyCubit),
        BlocProvider(
          create: (_) => FactCubit(apiService, historyCubit)..loadFact(),
        ),
        Provider(
          create: (_) => NavigationService(),
        ),
      ],
      child: const MyApp(
        initialRoute: '/',
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({Key? key, this.initialRoute = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const ShowFactPage(),
        );
      },
      routes: {
        '/facts': (BuildContext context) => const FactslistPage(),
      },
    );
  }
}
