import 'package:synlink_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:synlink_app/features/auth/domain/entities/user_entity.dart';
import 'package:synlink_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    final user = await authRemoteDataSource.login(email: email, password: password);
    return user;
  }

  @override
  Future<UserEntity> register(
    String username,
    String email,
    String password,
  ) async {
    final user = await authRemoteDataSource.register(
      username: username,
      email: email,
      password: password,
    );
    return user;
  }
}
