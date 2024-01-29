

import '../../model/database/utils.dart';
import '../../model/database/student_model.dart';
import 'db_helper.dart';

class StudentRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<StudentModel>> getData(String query) async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(
      tableName,
      columns: [
        'id',
        'name',
        'phoneNumber',
        'department',
      ],
    );
    
    List<StudentModel> student = [];

    for (int i = 0; i < maps.length; i++) {
      student.add(StudentModel.fromMap(maps[i]));
    }
    return query == ''
        ? student
        : student
            .where((element) =>
                element.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  Future<int> addData(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> updateData(StudentModel studentModel) async {
    print('updateData in studetn repo');
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> deleteData(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}