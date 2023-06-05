import 'package:flutter/material.dart';
import 'package:via_cep/src/UI/helper/ButtonWidget.dart';
import 'package:via_cep/src/UI/helper/fild_widgwt.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _passord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 600,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 50,
                    color: Color.fromARGB(255, 6, 105, 185),
                  ),
                  Text(
                    "Via Cep",
                    style: TextStyle(
                      color: Color.fromARGB(255, 6, 105, 185),
                      fontSize: 40,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Ex: email@email.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FildWidgwt(
                controller: _passord,
                label: "Passord",
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtonWidget(text: "Cadastrar"),
                  // ButtonWidget(text: "Entrar"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 6, 105, 185)),
                    child: const Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
