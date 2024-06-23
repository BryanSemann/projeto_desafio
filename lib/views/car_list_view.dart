import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/car_list_view_model.dart';

class CarListView extends StatelessWidget {
  const CarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars'),
      ),
      body: Consumer<CarListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.cars.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: viewModel.cars.length,
            itemBuilder: (context, index) {
              final car = viewModel.cars[index];
              return ListTile(
                title: Text('${car.nomeModelo} (${car.ano})'),
                subtitle: Text('${car.cor} - ${car.combustivel}'),
                trailing: Text('R\$ ${car.valor.toStringAsFixed(3)}'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/carDetail',
                    arguments: car,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
