import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/UI/helper/media_query_help.dart';
import 'package:via_cep/UI/widgets/appbar_help.dart';
import 'package:via_cep/UI/widgets/drawer_helper.dart';
import 'package:via_cep/UI/widgets/gradient.dart';

import '../../../data/Cubit/cep_bloc.dart';
import '../../widgets/show_dialog_error.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CepBloc cepCubit;
  final _cepEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cepCubit = BlocProvider.of<CepBloc>(context);
    cepCubit.stream.listen(
      (state) {
        if (state is FaluereCepState) {
          dialogError(
            context,
            "Cep Invalido",
            "Cep inexistente ou digitado de forma errada, Confira!!!",
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawerHelp(),
      appBar: appBar(0.1),
      body: SingleChildScrollView(
        child: Container(
          height: height(context, 1),
          width: width(context, 1),
          decoration: boxgradiente(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height(context, 0.30),
                width: width(context, 0.90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _cepEC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "CEP",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Cep não pode ser nulo";
                            }
                            if (value.length < 8) {
                              return "Cep precisa ser maior do que 8 digitos";
                            }
                            return null;
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cepCubit.findCep(cep: _cepEC.text);
                            _cepEC.clear();
                          }
                        },
                        child: const Text("Buscar"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height(context, 0.03),
              ),
              BlocBuilder<CepBloc, CepState>(
                builder: (context, state) {
                  if (state is LoadedCepState) {
                    return Container(
                      height: height(context, 0.3),
                      width: width(context, 0.9),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Cep:",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: state.cep.cep,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text.rich(
                              TextSpan(
                                text: "Rua:",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: state.cep.logradouro,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Complemento:",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: state.cep.complemento,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Bairro:",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: state.cep.bairro,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Cidade:",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: state.cep.localidade,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: "UF:",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: state.cep.uf,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is LoadingCepState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
