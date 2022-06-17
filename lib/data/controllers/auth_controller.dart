import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/models/auth_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(AuthModel authModel){
    _isLoading = true;
  }

  Future<void> getUsers(AuthModel authModel)async {

    authRepo.registration(authModel);

  }
}