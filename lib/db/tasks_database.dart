import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class TaskDataBase {
  static final TaskDataBase instance = TaskDataBase._init();

  static Database? _database;

  TaskDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final  idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''CREATE TABLE $tableTasks ( 
      ${TaskFields.id} $idType, 
      ${TaskFields.title} $textType,
      ${TaskFields.description} $textType,
      ${TaskFields.time} $textType,
      ${TaskFields.colortheme} $textType
    )
    ''');
  }

  Future<Task> create(Task task) async {
    final db = await instance.database;

    final id = await db.insert(tableTasks, task.toJson());
    print("task criada");
    return task.copy(id: id);
  }

  Future<Task> readTask({required int id}) async {
    final db = await instance.database;
    final maps = await db.query(tableTasks,
        columns: TaskFields.values,
        where: '${TaskFields.id} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Task>> readAllTasks() async {
    final db = await instance.database;
    const orderBy = '${TaskFields.time} ASC';

    final result = await db.query(tableTasks, orderBy: orderBy);
    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> update(Task task) async {
    final db = await instance.database;
    return db.update(tableTasks, task.toJson(),
        where: '${TaskFields.id} = ?', whereArgs: [task.id]);
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;
    return await db
        .delete(tableTasks, where: '${TaskFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
