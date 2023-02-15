import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviiku_app/src/blocs/poin_cubit.dart';
import 'package:moviiku_app/src/utilities/utilities.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PoinCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: myTheme,
      ),
    );
  }
}
