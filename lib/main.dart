import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/screens/home/home_page.dart';
import 'UI/screens/login/login_screen.dart';
import 'data/Cubit/cep_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CepBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 6, 105, 185)),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const LoginScreen(),
          "/home": (context) => const HomePage(),
        },
      ),
    );
  }
}
