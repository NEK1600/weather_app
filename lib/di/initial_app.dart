import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/base_di.dart';
import 'package:weather_app/di/base_provider.dart';

class InitialApp extends StatelessWidget {
  final BaseDi baseDi;

  const InitialApp({
    super.key,
    required this.baseDi,
  });

  @override
  Widget build(BuildContext context) {
    return BaseProvider(
      baseDi: baseDi,
      child: BlocProvider(
        create: (context) => baseDi.initialCubit()..initialApp(),
        lazy: false,
        child: MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: baseDi.router(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
