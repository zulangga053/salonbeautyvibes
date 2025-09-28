import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/theme/app_theme.dart';

class TestimonialsSection extends StatelessWidget {
  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Sari Indah',
      'service': 'Paket Wedding',
      'rating': 5,
      'review':
          'Pelayanan luar biasa! Tim Salon Beauty Vibes sangat profesional dan hasilnya melebihi ekspektasi. Hari pernikahan saya menjadi sangat berkesan berkat mereka.',
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
          'Hair stylist di sini sangat kreatif dan memahami keinginan customer. Rambut saya selalu tampil cantik setelah treatment di Salon Beauty Vibes.',
      'image': 'assets/images/customer3.jpg',
      'date': '10 Desember 2024',
    },
    {
      'name': 'Rina Marlina',
      'service': 'Spa & Massage',
      'rating': 5,
      'review':
          'Tempat yang sangat nyaman untuk relaksasi. Setelah spa di sini, badan terasa fresh dan stress hilang. Recommended banget!',
      'image': 'assets/images/customer4.jpg',
      'date': '5 Januari 2025',
    },
  ];

  TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.secondary.withOpacity(0.2),
      child: Column(
        children: [
          Text(
            'Apa Kata Customer Kami',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Kepuasan dan kepercayaan customer adalah prioritas utama kami',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          // Testimonials Carousel
          CarouselSlider.builder(
            itemCount: testimonials.length,
            itemBuilder: (context, index, realIndex) {
              return _buildTestimonialCard(testimonials[index]);
            },
            options: CarouselOptions(
              height: 300,
              viewportFraction: Get.width > 900
                  ? 0.4
                  : (Get.width > 600 ? 0.6 : 0.9),
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
          ),

          const SizedBox(height: 32),

          // Rating Summary
          _buildRatingSummary(),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(Map<String, dynamic> testimonial) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(testimonial['image']),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          testimonial['name'],
                          style: Get.textTheme.titleMedium,
                        ),
                        Text(
                          testimonial['service'],
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Rating Stars
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < testimonial['rating']
                            ? Icons.star
                            : Icons.star_border,
                        color: AppColors.accent,
                        size: 18,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Review Text
              Expanded(
                child: Text(
                  '"${testimonial['review']}"',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  Widget _buildRatingSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStat('500+', 'Customer Puas'),
          Container(width: 1, height: 40, color: AppColors.textLight),
          _buildStat('4.9', 'Rating Rata-rata'),
          Container(width: 1, height: 40, color: AppColors.textLight),
          _buildStat('98%', 'Repeat Customer'),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Get.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Get.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
