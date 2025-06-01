import 'package:synlink_app/features/auth/domain/entities/user_entity.dart';
import 'package:synlink_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});
  // This method is used to call the login method from the repository

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
