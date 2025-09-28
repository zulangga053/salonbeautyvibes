import 'package:get/get.dart';
import '../../core/constants/app_constants.dart';

class ServicesController extends GetxController {
  List<Map<String, dynamic>> services = AppConstants.services;
  List<Map<String, dynamic>> packages = AppConstants.packages;

  String selectedCategory = 'Semua';
  List<String> categories = [
    'Semua',
    'Rambut',
    'Make Up',
    'Skincare',
    'Nail Art',
    'Body Treatment',
  ];

  List<Map<String, dynamic>> get filteredServices {
    if (selectedCategory == 'Semua') {
      return services;
    }
    return services
        .where((service) => service['category'] == selectedCategory)
        .toList();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    update();
  }

  void bookService(String serviceId) {
    Get.toNamed('/reservasi', arguments: serviceId);
  }

  void bookPackage(String packageId) {
    Get.toNamed('/reservasi', arguments: packageId);
  }
}
