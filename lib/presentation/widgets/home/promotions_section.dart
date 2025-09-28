import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/custom_button.dart';
import '../../../core/theme/app_theme.dart';

class PromotionsSection extends StatelessWidget {
  final List<Map<String, String>> promotions = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'Promo & Penawaran Menarik',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Jangan lewatkan kesempatan emas untuk mendapatkan perawatan terbaik dengan harga spesial',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          // Promotions List
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: promotions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return _buildPromoCard(promotions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(Map<String, String> promo) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withOpacity(0.1),
              AppColors.secondary.withOpacity(0.1),
            ],
          ),
        ),
        child: Row(
          children: [
            // Promo Image
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(promo['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Promo Content
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Discount Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.goldGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'HEMAT ${promo['discount']}',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Promo Title
                    Text(promo['title']!, style: Get.textTheme.titleLarge),
                    const SizedBox(height: 8),

                    // Promo Description
                    Text(
                      promo['description']!,
                      style: Get.textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),

                    // Valid Until
                    Text(
                      'Berlaku hingga: ${promo['validUntil']}',
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // CTA Button
                    CustomButton(
                      text: 'Ambil Promo',
                      onPressed: () => Get.toNamed('/reservasi'),
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
