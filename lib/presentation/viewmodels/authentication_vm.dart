import 'package:first_flutter/data/models/user.dart';
import 'package:first_flutter/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationVM extends ChangeNotifier {
  final IAuthenticationRepository _authenticationRepository;

  AuthenticationVM({
    required IAuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _authenticationRepository.login(username, password);
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      _user = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
