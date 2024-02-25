import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:student_records/screens/Models/student.dart';
class SQLHelper{
  // static final SQLHelper _databaseService = SQLHelper._internal();
  // factory SQLHelper() => _databaseService;
  // SQLHelper._internal();
  // static Database? _database;
  // Future<Database> get database async {
  //   if (_database != null) return _database!;
  //   // Initialize the DB first time it is accessed
  //   _database = await _initDatabase();
  //   return _database!;
  // }
Future<Database> _initDatabase()async{
       return await openDatabase(
        join(await getDatabasesPath(),'student_records.dp'),
        onCreate: (db, version) {
          return db.execute("""CREATE TABLE Student(id integer primarr key autoincreament,
          name text,
          department text,
          enrollment_No integer,
          semester text
          )""");
        },
        version: 1,
      );

    
  }

Future<void> insertStudent(Student student)async{
    final db = await _initDatabase();
    print('data posted');
     print(student.sName);
    await db.insert('Student', student.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Student>> students()async{
  final db = await _initDatabase();
  final List<Map<String,dynamic>> map = await db.query('Student');

  return List.generate(map.length, (index) => Student.fromMap(map[index]));
}

}




  
 