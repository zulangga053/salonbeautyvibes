import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../common/custom_button.dart';
import '../../../core/theme/app_theme.dart';

class HeroBanner extends StatelessWidget {
  final List<Map<String, String>> bannerSlides = [
    {
      'title': 'Tampil Cantik Setiap Hari',
      'subtitle': 'Dengan perawatan premium dan layanan terpercaya',
      'image': 'assets/images/hero1.jpg',
      'cta': 'Reservasi Sekarang',
    },
    {
      'title': 'Paket Wedding Spesial',
      'subtitle': 'Wujudkan impian menjadi pengantin tercantik',
      'image': 'assets/images/hero2.jpg',
      'cta': 'Lihat Paket',
    },
    {
      'title': 'Treatment Glow Up',
      'subtitle': 'Transformasi total untuk kepercayaan diri maksimal',
      'image': 'assets/images/hero3.jpg',
      'cta': 'Pelajari Lebih',
    },
  ];

  HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.8,
      child: CarouselSlider.builder(
        itemCount: bannerSlides.length,
        itemBuilder: (context, index, realIndex) {
          final slide = bannerSlides[index];
          return _buildSlide(slide);
        },
        options: CarouselOptions(
          height: double.infinity,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          enableInfiniteScroll: true,
        ),
      ),
    );
  }

  Widget _buildSlide(Map<String, String> slide) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(slide['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slide['title']!,
                      style: Get.textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      slide['subtitle']!,
                      style: Get.textTheme.titleLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        CustomButton(
                          text: slide['cta']!,
                          onPressed: () => Get.toNamed('/reservasi'),
                          backgroundColor: AppColors.primary,
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                          text: 'Lihat Layanan',
                          onPressed: () => Get.toNamed('/layanan'),
                          isOutlined: true,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                        ),
                      ],
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
}
