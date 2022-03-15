import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/components/error_box.dart';
import 'package:clone_olx/screens/signup/components/field_title.dart';
import 'package:clone_olx/stores/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignupStore signUpStore = SignupStore();

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
                  Observer(
                    builder: (_) {
                      return ErrorBox(
                        message: signUpStore.error,
                      );
                    },
                  ),
                  const FieldTitle(
                    title: 'Apelido',
                    subtitle: 'Como aparecerá em seus anúncios.',
                  ),
                  Observer(
                    builder: (context) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Exemplo: João S.",
                          isDense: true,
                          errorText: signUpStore.nameError,
                        ),
                        onChanged: signUpStore.setName,
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
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Exemplo: joao@gmail.com",
                          isDense: true,
                          errorText: signUpStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signUpStore.setEmail,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja sua conta.',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Exemplo: (99) 9999-9999",
                          isDense: true,
                          errorText: signUpStore.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: signUpStore.setPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letra, números e caracteres especiais.',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: signUpStore.passError,
                        ),
                        obscureText: true,
                        onChanged: signUpStore.setPass,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FieldTitle(
                    title: 'Confirmar Senha',
                    subtitle: 'Repita a senha.',
                  ),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: signUpStore.confirmPassError,
                        ),
                        obscureText: true,
                        onChanged: signUpStore.setConfirmPass,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        height: 40,
                        child: ElevatedButton(
                          onPressed: signUpStore.signUpPressed,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            onSurface: Colors.orange.withAlpha(120),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: signUpStore.loading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.white,
                                  ),
                                )
                              : const Text("CADASTRAR"),
                        ),
                      );
                    },
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
