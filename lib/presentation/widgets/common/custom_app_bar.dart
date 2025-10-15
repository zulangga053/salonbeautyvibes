import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routes/app_routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.home),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 24, // Sesuaikan ukuran lebar logo
                    height: 24, // Sesuaikan ukuran tinggi logo
                    // color: Colors
                    //     .white, // Opsional: untuk memberikan efek warna seperti ikon
                    fit: BoxFit.contain, // Sesuaikan cara logo ditampilkan
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.businessName,
                      style: Get.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppConstants.tagline,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // Desktop Navigation
          if (Get.width > 800) _buildDesktopNav(),

          // Mobile Menu Button
          if (Get.width <= 800) _buildMobileMenuButton(),
        ],
      ),
    );
  }

  Widget _buildDesktopNav() {
    final menuItems = [
      {'title': 'Beranda', 'route': AppRoutes.home},
      {'title': 'Tentang Kami', 'route': AppRoutes.about},
      {'title': 'Layanan', 'route': AppRoutes.services},
      {'title': 'Galeri', 'route': AppRoutes.gallery},
      {'title': 'Kontak', 'route': AppRoutes.contact},
    ];

    return Row(
      children: [
        ...menuItems
            .map((item) => _buildNavItem(item['title']!, item['route']!))
            .toList(),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () => Get.toNamed(AppRoutes.booking),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Reservasi',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(String title, String route) {
    final isActive = Get.currentRoute == route;

    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: Get.textTheme.bodyMedium?.copyWith(
            color: isActive ? AppColors.primary : AppColors.textPrimary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          _buildMobileMenu(),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        );
      },
      icon: const Icon(Icons.menu, color: AppColors.textPrimary),
    );
  }

  Widget _buildMobileMenu() {
    final menuItems = [
      {'title': 'Beranda', 'route': AppRoutes.home, 'icon': Icons.home},
      {'title': 'Tentang Kami', 'route': AppRoutes.about, 'icon': Icons.info},
      {'title': 'Layanan', 'route': AppRoutes.services, 'icon': Icons.spa},
      {
        'title': 'Galeri',
        'route': AppRoutes.gallery,
        'icon': Icons.photo_library,
      },
      {
        'title': 'Kontak',
        'route': AppRoutes.contact,
        'icon': Icons.contact_phone,
      },
      {
        'title': 'Reservasi',
        'route': AppRoutes.booking,
        'icon': Icons.calendar_today,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          ...menuItems
              .map(
                (item) => ListTile(
                  leading: Icon(
                    item['icon'] as IconData,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    item['title'] as String,
                    style: Get.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.back();
                    Get.toNamed(item['route'] as String);
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
