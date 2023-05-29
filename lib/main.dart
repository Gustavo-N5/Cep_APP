import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/src/UI/screens/home/home_page.dart';
import 'package:via_cep/src/UI/screens/login/login_screen.dart';
import 'package:via_cep/src/data/Cubit/cep_bloc.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 6, 105, 185)),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => LoginScreen(),
          "/home": (context) => const HomePage(),
        },
      ),
    );
  }
}
