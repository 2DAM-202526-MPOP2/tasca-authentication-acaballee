import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/services/authetication_service.dart';

abstract class IAuthenticationRepository {
  Future<User> login(String username, String password);
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationService _authenticationService;

  AuthenticationRepository({
    required IAuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  @override
  Future<User> login(String username, String password) async {
    return await _authenticationService.validateLogin(username, password);
  }
}
