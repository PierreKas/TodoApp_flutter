import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmacy/database/conn_string.dart';
import 'package:pharmacy/models/users.dart';

class UsersDatabaseHelper {
  Future<List<Map<String, dynamic>>> getUsersToDB() async {
    final conn = await DatabaseHelper.getConnection();
    const sql = 'SELECT * FROM users';
    if (conn == null) {
      return [];
    }
    try {
      final results = await conn.execute(sql);
      final users = results.rows.map((row) => row.assoc()).toList();

      print('User retrived successfully');
      return users;
    } catch (e) {
      print('Error during SELECT operation: $e');
      return [];
    } finally {
      await conn.close();
    }
  }

  Future<Map<String, dynamic>?> getAuthenticationData(
      String phoneNumber, String password) async {
    final conn = await DatabaseHelper.getConnection();
    if (conn == null) {
      return null;
    }
    final sql = 'SELECT * FROM users WHERE phone_number='
        "$phoneNumber"
        ' AND pwd = "$password"';

    try {
      final results = await conn.execute(sql);
      if (results.rows.isNotEmpty) {
        final user = results.rows.first.assoc();
        print('User found');
        //Fluttertoast.showToast(msg: 'User info retrieved successfully');
        return user;
      } else {
        print(
            'No user found with the phone number $phoneNumber and password $password');
        Fluttertoast.showToast(
            msg:
                'Aucun utilisateur trouvé avec le numéro $phoneNumber et le code $password');
        return null;
      }
    } catch (e) {
      print('Error during SELECT operation: $e');
      return null;
    } finally {
      await conn.close();
    }
  }

  Future<Map<String, dynamic>?> getUserInfoToDB(int userId) async {
    final conn = await DatabaseHelper.getConnection();
    if (conn == null) {
      return null;
    }
    final sql = 'SELECT * FROM users WHERE user_id=' "$userId" '';

    try {
      final results = await conn.execute(sql);
      if (results.rows.isNotEmpty) {
        final user = results.rows.first.assoc();
        print('User info retrieved successfully');
        Fluttertoast.showToast(msg: 'User info retrieved successfully');
        return user;
      } else {
        print('No user found with the code : US$userId');
        Fluttertoast.showToast(msg: 'No user found with the code : US$userId');
        return null;
      }
    } catch (e) {
      print('Error during SELECT operation: $e');
      return null;
    } finally {
      await conn.close();
    }
  }

  Future<void> addUserToDB(User user) async {
    final conn = await DatabaseHelper.getConnection();
    if (conn == null) {
      return;
    }
    // await conn.execute(
    //     'INSERT INTO user(Full_name,phone_number, role, selling_point, pwd, user_state) VALUES (?,?,?,?,?,?)',
    //     {
    //       'Full_name': user.fullName,
    //       'phone_number': user.phoneNumber,
    //       'role': user.role,
    //       'selling_point': user.sellingPoint,
    //       'pwd': user.password,
    //       'user_state': null
    //     }
    //     );
    //await conn.close();
    final sql = '''
    INSERT INTO users (Full_name, role, selling_point, pwd,phone_number,user_state) 
    VALUES (
      '${user.fullName}', 
      '${user.role}', 
      '${user.sellingPoint}', 
      '${user.password}', 
      '${user.phoneNumber}', 
      'DENIED'
    )
  ''';

    try {
      await conn.execute(sql);
      print('User added successfully');
      Fluttertoast.showToast(msg: 'Utilisateur ajouté');
    } catch (e) {
      print('Error during INSERT operation: $e');
      Fluttertoast.showToast(msg: 'Une erreur s\'est produite');
    } finally {
      await conn.close();
    }
  }

  Future<Map<String, dynamic>?> updateUserInfoInTheDB(User user) async {
    final conn = await DatabaseHelper.getConnection();
    if (conn == null) {
      return null;
    }
    final sql = '''
  UPDATE users 
  SET 
    Full_name = '${user.fullName}', 
    pwd = '${user.password}',
    phone_number = '${user.phoneNumber}'
    
  WHERE 
    user_id = '${user.userId}'
  ''';
    try {
      final results = await conn.execute(sql);
      if (results.affectedRows.toInt() > 0) {
        print('User info updated');
        Fluttertoast.showToast(msg: 'Données modifiées');
      } else {
        print('No user found with the code : US${user.phoneNumber}');
        Fluttertoast.showToast(
            msg:
                'Le code US${user.phoneNumber} ne correspond à aucun utilisateur');
        return null;
      }
    } catch (e) {
      print('Error during UPDATE operation: $e');
      return null;
    } finally {
      await conn.close();
    }
    return null;
  }

  Future<Map<String, dynamic>?> updateUserStatusInTheDB(
      int userId, String userState) async {
    final conn = await DatabaseHelper.getConnection();
    if (conn == null) {
      return null;
    }
    final sql = '''
  UPDATE users 
  SET 
    user_state = '$userState'
    
    
  WHERE 
    user_id = '$userId'
  ''';
    try {
      final results = await conn.execute(sql);
      if (results.affectedRows.toInt() > 0) {
        print('User info updated');
        Fluttertoast.showToast(msg: 'Statut modifié');
      } else {
        print('No user found with the code : US$userId');
        Fluttertoast.showToast(
            msg: 'Le code US$userId ne correspond à aucun utilisateur');
        return null;
      }
    } catch (e) {
      print('Error during UPDATE operation: $e');
      return null;
    } finally {
      await conn.close();
    }
    return null;
  }
}
