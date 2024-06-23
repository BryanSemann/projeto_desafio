import 'package:flutter/foundation.dart';
import '../models/lead_model.dart';
import '../services/database_service.dart';
import '../services/api_service.dart';

class LeadSubmissionViewModel extends ChangeNotifier {
  DatabaseService databaseService = DatabaseService();
  ApiService apiService = ApiService();
  List<LeadModel> leads = [];

  Future<void> saveLead(LeadModel lead) async {
    await databaseService.insertLead(lead);
    notifyListeners();
  }

  Future<void> submitLeads() async {
    List<LeadModel> leads = await databaseService.fetchLeads();
    for (LeadModel lead in leads) {
      await apiService.postLead(lead);
    }
  }
}
