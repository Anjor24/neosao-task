import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch users with pagination
  Future<void> fetchUsers(int page, int limit) async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedUsers = await UserService().fetchUsers(page: page, limit: limit);
      if (page == 0) {
        _users = fetchedUsers;
      } else {
        _users.addAll(fetchedUsers);
      }
      _isLoading = false;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
    }

    notifyListeners();
  }
}
