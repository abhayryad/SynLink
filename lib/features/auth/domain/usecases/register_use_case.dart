import 'package:synlink_app/features/auth/domain/entities/user_entity.dart';
import 'package:synlink_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository} );
  // This method is used to call the login method from the repository

  Future<UserEntity> call(String username, String email, String password) {
    return repository.register(username, email, password);
  }
}
