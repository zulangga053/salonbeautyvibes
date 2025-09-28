import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/footer.dart';
import '../../../core/theme/app_theme.dart';

class GalleryPage extends StatelessWidget {
  final List<Map<String, String>> galleryItems = [
    {
      'image': 'assets/images/gallery1.jpg',
      'category': 'Hair Styling',
      'title': 'Modern Hair Cut',
    },
    {
      'image': 'assets/images/gallery2.jpg',
      'category': 'Make Up',
      'title': 'Bridal Make Up',
    },
    {
      'image': 'assets/images/gallery3.jpg',
      'category': 'Nail Art',
      'title': 'Elegant Nail Design',
    },
    // Add more gallery items
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            _buildHeader(),
            _buildGalleryGrid(),
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
            'Galeri Hasil Karya',
            style: Get.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Lihat transformasi menakjubkan dari para pelanggan kami',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Get.width > 900 ? 4 : (Get.width > 600 ? 3 : 2),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: galleryItems.length,
        itemBuilder: (context, index) {
          return _buildGalleryItem(galleryItems[index]);
        },
      ),
    );
  }

  Widget _buildGalleryItem(Map<String, String> item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(item['image'] ?? '', fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['category'] ?? '',
                  style: Get.textTheme.labelMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(item['title'] ?? '', style: Get.textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
