import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/footer.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class ContactPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            _buildHeader(),
            _buildContactSection(),
            _buildMapSection(),
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
            'Hubungi Kami',
            style: Get.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Siap membantu Anda untuk konsultasi dan reservasi',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contact Information
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Informasi Kontak', style: Get.textTheme.headlineMedium),
                  const SizedBox(height: 32),

                  // Contact Cards
                  _buildContactCard(
                    Icons.location_on,
                    'Alamat',
                    AppConstants.address,
                    () => _launchMaps(),
                  ),
                  const SizedBox(height: 20),

                  _buildContactCard(
                    Icons.phone,
                    'Telepon',
                    AppConstants.phoneNumber,
                    () => _launchPhone(),
                  ),
                  const SizedBox(height: 20),

                  _buildContactCard(
                    Icons.message,
                    'WhatsApp',
                    AppConstants.whatsappNumber,
                    () => _launchWhatsApp(),
                  ),
                  const SizedBox(height: 20),

                  _buildContactCard(
                    Icons.email,
                    'Email',
                    AppConstants.email,
                    () => _launchEmail(),
                  ),
                  const SizedBox(height: 20),

                  _buildContactCard(
                    Icons.schedule,
                    'Jam Operasional',
                    AppConstants.businessHours,
                    null,
                  ),

                  const SizedBox(height: 32),

                  // Social Media
                  Text('Ikuti Kami', style: Get.textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildSocialButton(
                        Icons.camera_alt,
                        'Instagram',
                        () => _launchInstagram(),
                        AppColors.primary,
                      ),
                      const SizedBox(width: 12),
                      _buildSocialButton(
                        Icons.video_library,
                        'TikTok',
                        () => _launchTikTok(),
                        Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 40),

            // Contact Form
            Expanded(
              flex: 3,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: _buildContactForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    IconData icon,
    String title,
    String content,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.textLight, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Get.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: Get.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.arrow_forward_ios, color: AppColors.primary, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    IconData icon,
    String platform,
    VoidCallback onTap,
    Color color,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              platform,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Kirim Pesan', style: Get.textTheme.titleLarge),
          const SizedBox(height: 24),

          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap *',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama lengkap wajib diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email *',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email wajib diisi';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Format email tidak valid';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Nomor WhatsApp *',
              prefixIcon: Icon(Icons.phone),
              hintText: 'Contoh: 081234567890',
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nomor WhatsApp wajib diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Pesan *',
              prefixIcon: Icon(Icons.message),
              hintText: 'Tuliskan pertanyaan atau kebutuhan Anda...',
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Pesan wajib diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: CustomButton(text: 'Kirim Pesan', onPressed: _submitForm),
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Chat WhatsApp Langsung',
              onPressed: _launchWhatsApp,
              isOutlined: true,
              icon: const Icon(Icons.message, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 400,
      width: double.infinity,
      color: AppColors.textLight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 80, color: AppColors.textSecondary),
            const SizedBox(height: 16),
            Text(
              'Google Maps Integration',
              style: Get.textTheme.titleMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Integrate with Google Maps API untuk menampilkan lokasi salon',
              style: Get.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'Buka di Google Maps', onPressed: _launchMaps),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show loading
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        Get.back(); // Close loading

        Get.snackbar(
          'Pesan Terkirim!',
          'Terima kasih ${_nameController.text}. Kami akan segera merespons pesan Anda.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );

        // Clear form
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();
      });
    }
  }

  void _launchPhone() async {
    final url = 'tel:${AppConstants.phoneNumber}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchWhatsApp() async {
    final url =
        'https://wa.me/${AppConstants.whatsappNumber.replaceAll('+', '').replaceAll(' ', '')}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchEmail() async {
    final url = 'mailto:${AppConstants.email}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchMaps() async {
    final url =
        'https://maps.google.com/?q=${Uri.encodeComponent(AppConstants.address)}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchInstagram() async {
    final url =
        'https://instagram.com/${AppConstants.instagram.replaceAll('@', '')}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void _launchTikTok() async {
    const url = 'https://tiktok.com/@bellabeautysalon';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
