import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../../components/app_bar_title.dart';
import '../../components/form_field.dart';
import '../../components/loading.dart';
import '../../models/client/address.dart';
import '../../models/client/client.dart';
import '../../models/delivery/package.dart';
import '../../repository/address_repository.dart';
import '../../repository/client_repository.dart';
import '../../repository/package_repository.dart';

class FormPackage extends StatefulWidget {
  const FormPackage({Key? key}) : super(key: key);

  @override
  State<FormPackage> createState() => _FormPackageState();
}

class _FormPackageState extends State<FormPackage> {
  final _addressRepository = AddressRepository();
  final _clientRepository = ClientRepository();
  final _packageRepository = PackageRepository();

  final _formKey = GlobalKey<FormState>();

  final _clientNameController = TextEditingController()..text = 'teste';
  final _weightController = TextEditingController()..text = '000';
  final _contactController = MaskedTextController(mask: '(00) 00000-0000')
    ..text = '00000000000';
  final _streetController = TextEditingController()
    ..text = 'testeeeeeeeeeeeeeeeeeeeeeee';
  final _neighborhoodController = TextEditingController()
    ..text = 'testeeeeeeeeeeeeeeeeeeeeeeeee';
  final _homeNumberController = TextEditingController()..text = '0000';
  final _cepController = MaskedTextController(mask: '00000-000')
    ..text = '00000000';
  final _packageDescriptionController = TextEditingController()..text = 'teste';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          loadingDialog(context);
          await saveForm();
          if (!mounted) return;
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarTitle(
                firstTitle: 'Adicione um novo', secondTitle: 'pacote'),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    FormFieldWidget(
                      type: TextInputType.text,
                      label: 'Nome do cliente',
                      controller: _clientNameController,
                      maxLengthText: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FormFieldWidget(
                            type: TextInputType.number,
                            label: 'Peso do pacote (Kg)',
                            controller: _weightController,
                            maxLengthText: 4,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FormFieldWidget(
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
                    FormFieldWidget(
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
                    FormFieldWidget(
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
                          child: FormFieldWidget(
                            type: TextInputType.number,
                            label: 'Número da casa',
                            controller: _homeNumberController,
                            maxLengthText: 10,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FormFieldWidget(
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
                    FormFieldWidget(
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

  Future<void> saveForm() async {
    final FormState? form = _formKey.currentState;
    if (form?.validate() ?? false) {
      Address newAddress = Address(
        bairro: _neighborhoodController.text,
        cep: _cepController.text,
        logradouro: _streetController.text,
        numero: _homeNumberController.text,
      );

      final idAddress = (await _addressRepository.createAddress(newAddress)).id;

      Client newClient = Client(
        nome: _clientNameController.text,
        idEndereco: idAddress,
        contato: _contactController.text,
      );

      final idClient = (await _clientRepository.createClient(newClient)).id;

      Package newPackage = Package(
        descricao: _packageDescriptionController.text,
        idCliente: idClient,
        codigoConfirmacao: _contactController.text,
        peso: double.parse(_weightController.text),
      );

      await _packageRepository.createPackage(newPackage);

      if (!mounted) return;
      Navigator.pop(context);
    } else {
      debugPrint('Form is invalid.');
    }
  }
}
