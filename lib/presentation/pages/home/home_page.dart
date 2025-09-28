import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:salonbeautyvibes/presentation/controllers/home_controller.dart';

import '../../../core/theme/app_theme.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/home/hero_banner.dart';
import '../../widgets/home/promotions_section.dart';
import '../../widgets/home/services_section.dart';
import '../../widgets/home/testimonials_section.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom App Bar
            CustomAppBar(),

            // Hero Banner
            HeroBanner(),

            // Services Section
            ServicesSection(),

            // Promotions Section
            PromotionsSection(),

            // About Preview
            _buildAboutPreview(),

            // Testimonials Section
            TestimonialsSection(),

            // Contact CTA Section
            _buildContactCTA(),

            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutPreview() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.secondary.withOpacity(0.3),
      child: Column(
        children: [
          Text(
            'Tentang Bella Beauty Salon',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Dengan pengalaman lebih dari 10 tahun, Bella Beauty Salon telah menjadi destinasi utama untuk perawatan kecantikan di Jakarta. Kami menghadirkan layanan terlengkap dengan tenaga ahli berpengalaman dan produk berkualitas premium.',
              style: Get.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: 'Pelajari Lebih Lanjut',
            onPressed: () => Get.toNamed('/tentang-kami'),
            isOutlined: true,
          ),
        ],
      ),
    );
  }

  Widget _buildContactCTA() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Column(
        children: [
          Text(
            'Siap Untuk Tampil Lebih Cantik?',
            style: Get.textTheme.headlineMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Reservasi sekarang dan dapatkan konsultasi gratis dengan beauty expert kami',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Reservasi Sekarang',
                onPressed: () => Get.toNamed('/reservasi'),
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
              ),
              const SizedBox(width: 16),
              CustomButton(
                text: 'Hubungi Kami',
                onPressed: () => Get.toNamed('/kontak'),
                isOutlined: true,
                borderColor: Colors.white,
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
