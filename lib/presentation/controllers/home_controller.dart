import 'package:get/get.dart';

class HomeController extends GetxController {
  // Promotions data
  List<Map<String, String>> promotions = [
    {
      'title': 'Promo Hari Ini',
      'description': 'Diskon 30% untuk semua layanan facial treatment',
      'discount': '30%',
      'validUntil': '31 Desember 2025',
      'image': 'assets/images/promo1.jpg',
    },
    {
      'title': 'Paket Wedding Spesial',
      'description': 'Hemat hingga Rp 1.000.000 untuk paket pengantin',
      'discount': 'Rp 1jt',
      'validUntil': '31 Januari 2026',
      'image': 'assets/images/promo2.jpg',
    },
    {
      'title': 'Member Baru',
      'description': 'Cashback 50% untuk treatment pertama member baru',
      'discount': '50%',
      'validUntil': 'Setiap hari',
      'image': 'assets/images/promo3.jpg',
    },
  ];

  // Featured services
  List<String> featuredServices = ['haircut', 'makeup', 'skincare'];

  void navigateToService(String serviceId) {
    Get.toNamed('/layanan', arguments: serviceId);
  }

  void bookService(String serviceId) {
    Get.toNamed('/reservasi', arguments: serviceId);
  }
}
