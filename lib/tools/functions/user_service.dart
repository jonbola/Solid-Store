import 'package:eletronic_conponents_store/database/helper/db_helper.dart';
import 'package:eletronic_conponents_store/database/model/user.dart';
class UserService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> registerCustomer(String email, String password) async {
    final newUser = UserModel(
      email: email,
      password: password,
      role: "customer", // Customer role is null
    );

    await _databaseHelper.addUser(newUser);
  }

  Future<void> registerAdmin(String email, String password) async {
    final newUser = UserModel(
      email: email,
      password: password,
      role: "admin", // Admin role
    );

    await _databaseHelper.addUser(newUser);
  }
}