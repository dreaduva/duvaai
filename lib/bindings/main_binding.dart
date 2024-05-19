import 'package:get/get.dart';
import 'package:duvaai/controllers/auth_controller.dart';
import 'package:duvaai/controllers/dashboard_controller.dart';
import 'package:duvaai/controllers/automations/google/google_reviews_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<GoogleReviewsController>(() => GoogleReviewsController());
  }
}
