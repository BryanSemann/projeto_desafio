import 'package:flutter/foundation.dart';
import '../models/car_model.dart';

class CarDetailViewModel extends ChangeNotifier {
  CarModel? selectedCar;

  void selectCar(CarModel car) {
    selectedCar = car;
    notifyListeners();
  }
}
