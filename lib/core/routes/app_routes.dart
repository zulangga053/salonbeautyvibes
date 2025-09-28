import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:salonbeautyvibes/presentation/pages/home/home_page.dart';

import '../../presentation/pages/about/about_page.dart';
import '../../presentation/pages/booking/booking_page.dart';
import '../../presentation/pages/contact/contact_page.dart';
import '../../presentation/pages/gallery/gallery_page.dart';
import '../../presentation/pages/products/products_page.dart';
import '../../presentation/pages/services/services_page.dart';
import '../../presentation/pages/testimonials/testimonials_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/tentang-kami';
  static const String services = '/layanan';
  static const String booking = '/reservasi';
  static const String gallery = '/galeri';
  static const String contact = '/kontak';
  static const String products = '/produk';
  static const String testimonials = '/testimoni';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: about, page: () => AboutPage()),
    GetPage(name: services, page: () => ServicesPage()),
    GetPage(name: booking, page: () => BookingPage()),
    GetPage(name: gallery, page: () => GalleryPage()),
    GetPage(name: contact, page: () => ContactPage()),
    GetPage(name: products, page: () => ProductsPage()),
    GetPage(name: testimonials, page: () => TestimonialsPage()),
  ];
}
