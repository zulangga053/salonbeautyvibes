// lib/presentation/pages/about/about_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/footer.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            _buildHeroSection(),
            _buildStorySection(),
            _buildVisionMissionSection(),
            _buildTeamSection(),
            _buildAchievementsSection(),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: Get.height * 0.6,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.9),
            AppColors.secondary.withOpacity(0.7),
          ],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tentang ${AppConstants.businessName}',
                style: Get.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 48,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Lebih dari 10 tahun menghadirkan layanan kecantikan terbaik dengan standar internasional',
                style: Get.textTheme.titleLarge?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorySection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          children: [
            if (Get.width > 768)
              Expanded(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/about_story.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

            if (Get.width > 768) const SizedBox(width: 40),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cerita Kami', style: Get.textTheme.headlineMedium),
                  const SizedBox(height: 24),
                  Text(
                    'Bella Beauty Salon dimulai dari impian sederhana untuk memberikan pengalaman kecantikan yang tak terlupakan. Didirikan pada tahun 2014, kami telah melayani ribuan pelanggan dengan dedikasi tinggi.',
                    style: Get.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Dengan tim yang terdiri dari para ahli berpengalaman dan produk-produk berkualitas premium, kami terus berinovasi untuk memberikan hasil terbaik bagi setiap pelanggan.',
                    style: Get.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Kepercayaan dan kepuasan Anda adalah prioritas utama kami. Setiap layanan dirancang untuk tidak hanya memperindah penampilan, tetapi juga meningkatkan kepercayaan diri.',
                    style: Get.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Lihat Layanan Kami',
                    onPressed: () => Get.toNamed('/layanan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisionMissionSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.secondary.withOpacity(0.2),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            Text(
              'Visi & Misi Kami',
              style: Get.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vision Card
                Expanded(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary.withOpacity(0.1),
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.visibility,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'VISI',
                            style: Get.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Menjadi salon kecantikan terdepan di Indonesia yang menghadirkan standar layanan internasional dengan sentuhan personal untuk setiap pelanggan.',
                            style: Get.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Mission Card
                Expanded(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accent.withOpacity(0.1),
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: AppColors.goldGradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.flag,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'MISI',
                            style: Get.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.accent,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Memberikan layanan kecantikan berkualitas tinggi, menggunakan produk premium, dan menciptakan pengalaman yang memuaskan untuk meningkatkan kepercayaan diri setiap pelanggan.',
                            style: Get.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Tim Profesional Kami',
            style: Get.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Dipercaya oleh para ahli kecantikan berpengalaman dan bersertifikat internasional',
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
                crossAxisCount: Get.width > 900 ? 3 : (Get.width > 600 ? 2 : 1),
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.8,
              ),
              itemCount: AppConstants.teamMembers.length,
              itemBuilder: (context, index) {
                return _buildTeamMemberCard(AppConstants.teamMembers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(Map<String, String> member) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            // Member Photo Placeholder
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  member['name']![0],
                  style: Get.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Member Name
            Text(
              member['name']!,
              style: Get.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Member Position
            Text(
              member['position']!,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Experience
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                member['experience']!,
                style: Get.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Specialty
            Text(
              'Spesialisasi:',
              style: Get.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              member['specialty']!,
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(gradient: AppColors.primaryGradient),
      child: Column(
        children: [
          Text(
            'Pencapaian Kami',
            style: Get.textTheme.headlineMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Row(
              children: [
                Expanded(
                  child: _buildAchievementItem(
                    '10+',
                    'Tahun Pengalaman',
                    Icons.schedule,
                  ),
                ),
                Expanded(
                  child: _buildAchievementItem(
                    '5000+',
                    'Customer Puas',
                    Icons.people,
                  ),
                ),
                Expanded(
                  child: _buildAchievementItem(
                    '15+',
                    'Layanan Terlengkap',
                    Icons.spa,
                  ),
                ),
                Expanded(
                  child: _buildAchievementItem(
                    '98%',
                    'Tingkat Kepuasan',
                    Icons.star,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String number, String label, IconData icon) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 16),
        Text(
          number,
          style: Get.textTheme.headlineLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Get.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.9),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
