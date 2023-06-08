import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/src/UI/helper/show_dialog_error.dart';
import 'package:via_cep/src/data/Cubit/cep_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CepBloc cepCubit;
  final cepEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cepCubit = BlocProvider.of<CepBloc>(context);
    cepCubit.stream.listen((state) {
      if (state is FaluereCepState) {
        dialogError(
          context,
          "Cep Invalido",
          "Cep inexistente ou digitado de forma errada, Confira!!!",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: cepEC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'CEP obrigatorio';
                    }
                    if (value.length < 8 && value.isNotEmpty) {
                      return "Cep precisa no minimo 8 digitus";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder(
                bloc: cepCubit,
                builder: (context, state) {
                  if (state is LoadingCepState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 6, 105, 185),
                      ),
                    );
                  }
                  return const SizedBox(
                    height: 0,
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cepCubit.findCep(cep: cepEC.text);
                      cepEC.clear();
                    }
                  },
                  child: const Text('Busca Cep')),
              const SizedBox(
                height: 80,
              ),
              BlocBuilder<CepBloc, CepState>(
                bloc: cepCubit,
                builder: (context, state) {
                  if (state is LoadedCepState) {
                    return Column(
                      children: [
                        Text("Cep: ${state.cep.cep}"),
                        Text("Logradouro: ${state.cep.logradouro}"),
                        Text("Complemento: ${state.cep.complemento}"),
                        Text("Bairro: ${state.cep.bairro}"),
                        Text("Cidade: ${state.cep.localidade}"),
                        Text("Estado: ${state.cep.uf}"),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
