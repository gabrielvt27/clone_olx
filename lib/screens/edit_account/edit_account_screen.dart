import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_olx/stores/edita_account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccountScreens extends StatelessWidget {
  EditAccountScreens({Key? key}) : super(key: key);

  final EditAccountStore store = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Conta"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return ToggleSwitch(
                        minWidth: constraints.biggest.width / 2.01,
                        totalSwitches: 2,
                        labels: const ['Particular', 'Profissional'],
                        cornerRadius: 20,
                        activeBgColor: const [Colors.purple],
                        inactiveBgColor: Colors.grey,
                        activeFgColor: Colors.white,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        onToggle: store.setUserType,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        onChanged: store.setName,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          isDense: true,
                          labelText: "Nome*",
                          labelStyle: const TextStyle(
                            color: Colors.purple,
                          ),
                          errorText: store.nameError,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        onChanged: store.setPhone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          isDense: true,
                          labelText: "Telefone*",
                          labelStyle: const TextStyle(
                            color: Colors.purple,
                          ),
                          errorText: store.phoneError,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: store.setPass1,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      isDense: true,
                      labelText: "Nova Senha",
                      labelStyle: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        onChanged: store.setPass2,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                          isDense: true,
                          labelText: "Confirmar Nova Senha*",
                          labelStyle: const TextStyle(
                            color: Colors.purple,
                          ),
                          errorText: store.passError,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 40,
                    child: Observer(builder: (_) {
                      return ElevatedButton(
                        onPressed: store.formValid ? () {} : null,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onSurface: Colors.orange.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text("Salvar"),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onSurface: Colors.red.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Sair"),
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
