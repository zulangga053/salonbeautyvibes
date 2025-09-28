import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';
import '../../../core/theme/app_theme.dart';

class TestimonialsPage extends StatelessWidget {
  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Sari Indah',
      'service': 'Paket Wedding',
      'rating': 5,
      'review':
          'Pelayanan luar biasa! Tim Bella Beauty Salon sangat profesional dan hasilnya melebihi ekspektasi. Hari pernikahan saya menjadi sangat berkesan berkat mereka.',
      'image': 'assets/images/customer1.jpg',
      'date': '15 Desember 2024',
    },
    {
      'name': 'Maya Putri',
      'service': 'Facial Treatment',
      'rating': 5,
      'review':
          'Sudah 2 tahun jadi customer setia di sini. Kulit wajah saya jadi lebih sehat dan glowing. Produk yang digunakan juga berkualitas premium.',
      'image': 'assets/images/customer2.jpg',
      'date': '28 November 2024',
    },
    {
      'name': 'Dewi Lestari',
      'service': 'Hair Styling',
      'rating': 5,
      'review':
          'Hair stylist di sini sangat kreatif dan memahami keinginan customer. Rambut saya selalu tampil cantik setelah treatment di Bella Beauty Salon.',
      'image': 'assets/images/customer3.jpg',
      'date': '10 Desember 2024',
    },
    // Add more testimonials
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            _buildHeader(),
            _buildTestimonialsList(),
            _buildRatingStats(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
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
            'Testimoni Pelanggan',
            style: Get.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Dengarkan pengalaman nyata dari pelanggan setia kami',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialsList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: testimonials
            .map((testimonial) => _buildTestimonialCard(testimonial))
            .toList(),
      ),
    );
  }

  Widget _buildTestimonialCard(Map<String, dynamic> testimonial) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Avatar
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary,
                child: Text(
                  testimonial['name'][0],
                  style: Get.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),

              // Testimonial Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Customer Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testimonial['name'],
                              style: Get.textTheme.titleLarge,
                            ),
                            Text(
                              testimonial['service'],
                              style: Get.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        // Rating Stars
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < testimonial['rating']
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppColors.accent,
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Review Text
                    Text(
                      '"${testimonial['review']}"',
                      style: Get.textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Date
                    Text(
                      testimonial['date'],
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: AppColors.secondary.withOpacity(0.2),
      child: Column(
        children: [
          Text(
            'Rating & Statistik',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard('4.9/5.0', 'Rating Rata-rata', Icons.star),
              _buildStatCard('500+', 'Total Review', Icons.reviews),
              _buildStatCard('98%', 'Kepuasan Customer', Icons.thumb_up),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 150,
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 40),
            const SizedBox(height: 12),
            Text(
              value,
              style: Get.textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Get.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
