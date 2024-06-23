import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/car_list_view_model.dart';
import 'view_models/car_detail_view_model.dart';
import 'view_models/lead_submission_view_model.dart';
import 'views/car_list_view.dart';
import 'views/car_detail_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarListViewModel()..fetchCars()),
        ChangeNotifierProvider(create: (_) => CarDetailViewModel()),
        ChangeNotifierProvider(create: (_) => LeadSubmissionViewModel()),
      ],
      child: MaterialApp(
        title: 'Car App',
        initialRoute: '/',
        routes: {
          '/': (context) => const CarListView(),
          '/carDetail': (context) => const CarDetailView(),
        },
      ),
    );
  }
}
