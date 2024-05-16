
import 'package:educativa_frontend/src/models/login/login_model.dart';

mixin LoginService {
  Future<Map<String, dynamic>> login(LoginModel loginRequest);
  
}
