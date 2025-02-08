import 'package:estateapp1/common/authentication/repostries/user_repostry.dart';
import 'package:get/get.dart';
import '../common/authentication/login/login_screen.dart';
import '../common/widgets/manager/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
    // Get.put(NavigationController());
    Get.put(LoginScreen());


    // Get.put(CartController());
  }
}