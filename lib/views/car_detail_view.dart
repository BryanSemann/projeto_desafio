import 'package:flutter/material.dart';
import 'package:projeto_desafio/models/lead_model.dart';
import '../models/car_model.dart';
import 'package:provider/provider.dart';
import '../view_models/lead_submission_view_model.dart';

class CarDetailView extends StatelessWidget {
  const CarDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final car = ModalRoute.of(context)!.settings.arguments as CarModel;
    return Scaffold(
      appBar: AppBar(title: Text('${car.nomeModelo} (${car.ano})')),
      body: Center(
        child: Column(
          children: [
            Text('Modelo: ${car.nomeModelo}'),
            Text('Ano: ${car.ano}'),
            Text('Combustível: ${car.combustivel}'),
            Text('Número de Portas: ${car.numPortas}'),
            Text('Cor: ${car.cor}'),
            Text('Valor: R\$ ${car.valor.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                final lead = LeadModel(
                  carId: car.id,
                  userEmail: 'user@example.com',
                  userPhone: '(11) 99876-5432',
                );
                Provider.of<LeadSubmissionViewModel>(context, listen: false)
                    .saveLead(lead);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lead salvo!')),
                );
              },
              child: const Text('Eu Quero'),
            ),
          ],
        ),
      ),
    );
  }
}
