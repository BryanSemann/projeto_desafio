import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/car_model.dart';
import '../models/lead_model.dart';

class ApiService {
  final String baseUrl = 'https://wswork.com.br';

  Future<List<CarModel>> fetchCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars.json'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['cars'];
      return body.map((json) => CarModel.fromJSON(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<void> postLead(LeadModel lead) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cars/leads'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(lead.toJSON()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to post lead');
    }
  }
}
