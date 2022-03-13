import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/screens/signup/components/field_title.dart';
import 'package:clone_olx/stores/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FieldTitle(
                    title: 'Apelido',
                    subtitle: 'Como aparecerá em seus anúncios.',
                  ),
                  Observer(
                    builder: (context) {
                      return TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Exemplo: João S.",
                          isDense: true,
                          errorText: signupStore.nameError,
                        ),
                        onChanged: signupStore.setName,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de  confirmação.',
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Exemplo: joao@gmail.com",
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja sua conta.',
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Exemplo: (99) 9999-9999",
                      isDense: true,
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letra, números e caracteres especiais.',
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'Confirmar Senha',
                    subtitle: 'Repita a senha.',
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: const Text("CADASTRAR"),
                    ),
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          'Já tem uma conta? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
