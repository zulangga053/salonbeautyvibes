import 'package:get/get.dart';
import '../../presentation/controllers/home_controller.dart';
import '../../presentation/controllers/booking_controller.dart';
import '../../presentation/controllers/services_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BookingController>(() => BookingController());
    Get.lazyPut<ServicesController>(() => ServicesController());
  }
}
