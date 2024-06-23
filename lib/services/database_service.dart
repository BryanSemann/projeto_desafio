import 'package:projeto_desafio/models/lead_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'leads.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE leads(carId INTEGER, userEmail TEXT, userPhone TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertLead(LeadModel lead) async {
    final db = await database;
    await db.insert('leads', lead.toJSON());
  }

  Future<List<LeadModel>> fetchLeads() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('leads');
    return List.generate(maps.length, (i) {
      return LeadModel(
        carId: maps[i]['carId'],
        userEmail: maps[i]['userEmail'],
        userPhone: maps[i]['userPhone'],
      );
    });
  }
}
