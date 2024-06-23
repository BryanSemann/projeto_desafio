import 'package:flutter/foundation.dart';
import '../models/car_model.dart';
import '../services/api_service.dart';

class CarListViewModel extends ChangeNotifier {
  List<CarModel> cars = [];
  ApiService apiService = ApiService();

  Future<void> fetchCars() async {
    cars = await apiService.fetchCars();
    notifyListeners();
  }
}
