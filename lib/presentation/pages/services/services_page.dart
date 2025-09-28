import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/footer.dart';
import '../../controllers/services_controller.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class ServicesPage extends GetView<ServicesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            _buildHeader(),
            _buildServicesGrid(),
            _buildPackagesSection(),
            _buildCTASection(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Layanan Kami',
            style: Get.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Nikmati pengalaman kecantikan terlengkap dengan layanan premium dan tenaga ahli berpengalaman',
              style: Get.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Layanan Unggulan',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width > 900
                      ? 3
                      : (Get.width > 600 ? 2 : 1),
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.85,
                ),
                itemCount: AppConstants.services.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: Get.width > 900
                        ? 3
                        : (Get.width > 600 ? 2 : 1),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: _buildServiceCard(AppConstants.services[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, AppColors.secondary.withOpacity(0.1)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image Placeholder
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getServiceIcon(service['id']),
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),

            // Service Category Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                service['category'],
                style: Get.textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Service Name
            Text(
              service['name'],
              style: Get.textTheme.titleLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Service Description
            Text(
              service['description'],
              style: Get.textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),

            // Service Details
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga:',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        service['price'],
                        style: Get.textTheme.titleMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Durasi:',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        service['duration'],
                        style: Get.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Book Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Reservasi Sekarang',
                onPressed: () =>
                    Get.toNamed('/reservasi', arguments: service['id']),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackagesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.secondary.withOpacity(0.2),
      child: Column(
        children: [
          Text(
            'Paket Spesial',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Hemat lebih banyak dengan paket layanan kombinasi',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Get.width > 600 ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: Get.width > 600 ? 1.2 : 1.1,
              ),
              itemCount: AppConstants.packages.length,
              itemBuilder: (context, index) {
                return _buildPackageCard(AppConstants.packages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard(Map<String, dynamic> package) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [AppColors.accent.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Package Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.card_giftcard,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 20),

            // Package Name
            Text(
              package['name'],
              style: Get.textTheme.titleLarge?.copyWith(
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 8),

            // Package Description
            Text(package['description'], style: Get.textTheme.bodyMedium),
            const SizedBox(height: 16),

            // Package Price
            Text(
              package['price'],
              style: Get.textTheme.headlineSmall?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Package Includes
            Text(
              'Termasuk:',
              style: Get.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            ...(package['includes'] as List)
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.accent,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(item, style: Get.textTheme.bodySmall),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            const Spacer(),

            // Book Package Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Pilih Paket',
                onPressed: () =>
                    Get.toNamed('/reservasi', arguments: package['id']),
                backgroundColor: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCTASection() {
    return Container(
      padding: const EdgeInsets.all(60),
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Column(
        children: [
          Text(
            'Masih Bingung Memilih?',
            style: Get.textTheme.headlineMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Konsultasi gratis dengan beauty expert kami untuk mendapatkan rekomendasi treatment yang tepat',
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
                text: 'Konsultasi Gratis',
                onPressed: () => Get.toNamed('/kontak'),
                backgroundColor: Colors.white,
                textColor: AppColors.primary,
              ),
              const SizedBox(width: 16),
              CustomButton(
                text: 'Lihat Galeri',
                onPressed: () => Get.toNamed('/galeri'),
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

  IconData _getServiceIcon(String serviceId) {
    switch (serviceId) {
      case 'haircut':
        return Icons.content_cut;
      case 'makeup':
        return Icons.brush;
      case 'skincare':
        return Icons.face;
      case 'nails':
        return Icons.colorize;
      case 'spa':
        return Icons.spa;
      default:
        return Icons.star;
    }
  }
}
