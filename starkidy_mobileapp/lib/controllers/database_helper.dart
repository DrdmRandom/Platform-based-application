import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'report_book.db');
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE reports(id INTEGER PRIMARY KEY, studentId TEXT, note TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> addOrUpdateReport(String studentId, String note) async {
    final db = await database;
    await db.insert(
      'reports',
      {'studentId': studentId, 'note': note},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getReport(String studentId) async {
    final db = await database;
    var result = await db.query(
      'reports',
      where: 'studentId = ?',
      whereArgs: [studentId],
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<List<Map<String, dynamic>>> getAllStudentIDs() async {
    final db = await database;
    var result = await db.query('reports', columns: ['studentId']);
    print('Fetched Student IDs: $result'); // Debug log
    return result;
  }
}
