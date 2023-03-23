import 'package:flutter/material.dart';
import 'package:softito_final_project/models/reset_password.dart';
import 'package:softito_final_project/services/reset_password.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final _service = ResetPasswordService();

  ResetPasswordModel? _resetPassword;
  ResetPasswordModel get resetPassword1 => _resetPassword!;

  String? _text;
  String get text => _text!;
  bool _isSended = false;
  bool get isRegister => _isSended;
  Future resetPasswordFunc(String email) async {
    ResetPasswordModel resetPassword =
        ResetPasswordModel(email: email, requestType: "PASSWORD_RESET");
    final response = await _service.resetPasswordFunc(resetPassword);
    _text = response;
    _isSended = _service.isSended;
    notifyListeners();
  }
}
