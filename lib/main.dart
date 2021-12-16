import 'package:crypto_deeprooted/bloc/btc_bloc/btc_bloc.dart';
import 'package:crypto_deeprooted/bloc/btc_bloc/btc_state.dart';
import 'package:crypto_deeprooted/config/app_routes.dart';
import 'package:crypto_deeprooted/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BTCBloc(BTCStateInitialState(), Repository())),
      ],
      child: MaterialApp(
        title: 'DMS Picklite',
        theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "Brandon"),
        onGenerateRoute: generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
