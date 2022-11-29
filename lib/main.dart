import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todov2/bloc/crud_bloc.dart';
import 'package:todov2/pages/home_page.dart';

// import 'pages/home_page.dart';

Color white = const Color(0xFFFFFFFF);

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CrudBloc())
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // primarySwatch: Colors.blueGrey,
            ),
            home: const HomePage()),
    );
  }
}
