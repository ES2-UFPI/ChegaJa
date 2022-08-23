import 'package:chegaja_frontend/models/client/adress.dart';
import 'package:chegaja_frontend/models/client/client.dart';
import 'package:chegaja_frontend/models/delivery/package.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../../components/title.dart';

class FormPackage extends StatefulWidget {
  const FormPackage({Key? key}) : super(key: key);

  @override
  State<FormPackage> createState() => _FormPackageState();
}

class _FormPackageState extends State<FormPackage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final MaskedTextController _contactController =
      MaskedTextController(mask: '(00) 00000-0000');
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _homeNumberController = TextEditingController();
  final MaskedTextController _cepController =
      MaskedTextController(mask: '00000-000');
  final TextEditingController _packageDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          validateForm();
          // Navigator.of(context).pushNamed('/enterprise/form_delivery');
        },
        child: const Icon(Icons.check),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_backspace, size: 35),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const BuildTitle(
                  firstTitle: 'Adicione um novo',
                  secondTitle: 'pacote',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    FormField(
                      type: TextInputType.text,
                      label: 'Nome do cliente',
                      controller: _clientNameController,
                      maxLengthText: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormField(
                            type: TextInputType.number,
                            label: 'Peso do pacote (Kg)',
                            controller: _weightController,
                            maxLengthText: 4,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FormField(
                            type: TextInputType.number,
                            label: 'Contato',
                            controller: _contactController,
                            validator: (text) {
                              if (_contactController.unmasked.length < 11) {
                                return 'Mínimo de 12 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    FormField(
                      type: TextInputType.text,
                      label: 'Rua',
                      controller: _streetController,
                      maxLengthText: 50,
                      validator: (text) {
                        if ((text?.length ?? 0) < 10) {
                          return 'Mínimo de 10 caracteres';
                        }
                        return null;
                      },
                    ),
                    FormField(
                      type: TextInputType.text,
                      label: 'Bairro',
                      maxLengthText: 50,
                      controller: _neighborhoodController,
                      validator: (text) {
                        if ((text?.length ?? 0) < 10) {
                          return 'Mínimo de 10 caracteres';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormField(
                            type: TextInputType.number,
                            label: 'Número da casa',
                            controller: _homeNumberController,
                            maxLengthText: 10,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FormField(
                            type: TextInputType.number,
                            label: 'CEP',
                            controller: _cepController,
                            validator: (text) {
                              if (_cepController.unmasked.length < 8) {
                                return 'Mínimo de 8 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    FormField(
                      type: TextInputType.text,
                      label: 'Descrição do pacote',
                      controller: _packageDescriptionController,
                      isLast: true,
                      maxLengthText: 200,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void validateForm() {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      Adress newAdress = Adress(
        bairro: _neighborhoodController.text,
        cep: _cepController.text,
        logradouro: _streetController.text,
        numero: _homeNumberController.text,
      );

      Client newClient = Client(
        nome: _clientNameController.text,
        idEndereco: 1,
        contato: _contactController.text,
      );

      Package newPackage = Package(
        descricao: _packageDescriptionController.text,
        idCliente: 1,
        codigoConfirmacao: _contactController.text,
        peso: double.parse(_weightController.text),
      );

      Navigator.pop(context, [newClient, newAdress, newPackage]);
    } else {
      debugPrint('Form is invalid.');
    }
  }
}

class FormField extends StatelessWidget {
  FormField({
    Key? key,
    required this.type,
    required this.label,
    required this.controller,
    this.isLast = false,
    this.validator,
    this.maxLengthText,
  }) : super(key: key);

  final TextInputType type;
  final String label;
  final TextEditingController controller;
  bool isLast;
  String? Function(String?)? validator;
  int? maxLengthText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: validator ??
            (value) {
              return (value?.isEmpty ?? true)
                  ? '$label não pode ficar vazio'
                  : null;
            },
        keyboardType: type,
        maxLength: maxLengthText,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
