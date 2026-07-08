import '../ models/user_model.dart';
import 'auth_datasource.dart';

class AuthRepository {

  final AuthDatasource datasource;

  AuthRepository(this.datasource);

  Future<void> login({
    required String email,
    required String password,
  }) {
    return datasource.login(email: email, password: password);
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return datasource.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
  Future<UserModel> getCurrentUser() {
    return datasource.getCurrentUser();
  }
  // role selction
  Future<void> saveRole(String role){

    return datasource.saveRole(role);

  }
}