import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../controllers/booking_controller.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/footer.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class BookingPage extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            _buildHeader(),
            _buildBookingForm(),
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
            'Reservasi Online',
            style: Get.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Pilih layanan, tanggal, dan waktu yang sesuai dengan kebutuhan Anda',
            style: Get.textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBookingForm() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: GetBuilder<BookingController>(
          builder: (controller) {
            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step Indicator
                    _buildStepIndicator(controller.currentStep),
                    const SizedBox(height: 32),

                    // Form Content
                    if (controller.currentStep == 1)
                      _buildServiceSelection(controller),
                    if (controller.currentStep == 2)
                      _buildDateTimeSelection(controller),
                    if (controller.currentStep == 3)
                      _buildPersonalInfo(controller),
                    if (controller.currentStep == 4)
                      _buildConfirmation(controller),

                    const SizedBox(height: 32),

                    // Navigation Buttons
                    _buildNavigationButtons(controller),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int currentStep) {
    final steps = [
      'Pilih Layanan',
      'Tanggal & Waktu',
      'Data Pribadi',
      'Konfirmasi',
    ];

    return Row(
      children: List.generate(steps.length, (index) {
        final stepNumber = index + 1;
        final isActive = stepNumber == currentStep;
        final isCompleted = stepNumber < currentStep;

        return Expanded(
          child: Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isActive || isCompleted
                      ? AppColors.primary
                      : AppColors.textLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCompleted ? Icons.check : Icons.circle,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                steps[index],
                style: Get.textTheme.titleMedium?.copyWith(
                  color: isActive ? AppColors.accent : AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildServiceSelection(BookingController controller) {
    final services = AppConstants.services;
    final selectedServices = controller.selectedServices;
    final selectedPackage = controller.selectedPackage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pilih Layanan', style: Get.textTheme.titleLarge),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: services.map<Widget>((service) {
            final isSelected = selectedServices.contains(service['id']);
            return GestureDetector(
              onTap: () => controller.toggleService(service['id']),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withOpacity(0.1)
                      : Colors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.textLight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getServiceIcon(service['id']),
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      service['name'],
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    if (isSelected)
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                          size: 18,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        Text('Atau Pilih Paket', style: Get.textTheme.titleMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AppConstants.packages.map<Widget>((package) {
            final isSelected = selectedPackage == package['name'];
            return GestureDetector(
              onTap: () => controller.selectPackage(package['name']),
              child: Container(
                width: 220,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.accent.withOpacity(0.1)
                      : Colors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.accent : AppColors.textLight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          color: isSelected
                              ? AppColors.accent
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            package['name'],
                            style: Get.textTheme.titleMedium?.copyWith(
                              color: isSelected
                                  ? AppColors.accent
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.accent,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      package['description'],
                      style: Get.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      package['price'],
                      style: Get.textTheme.titleMedium?.copyWith(
                        color: AppColors.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Termasuk: ${(package['includes'] as List).join(', ')}',
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateTimeSelection(BookingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pilih Tanggal & Waktu', style: Get.textTheme.titleLarge),
        const SizedBox(height: 24),

        // Calendar
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textLight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TableCalendar<String>(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 90)),
            focusedDay: controller.selectedDate ?? DateTime.now(),
            selectedDayPredicate: (day) {
              return controller.selectedDate != null &&
                  isSameDay(controller.selectedDate!, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              controller.selectDate(selectedDay);
            },
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: AppColors.textSecondary),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: Get.textTheme.titleMedium!,
            ),
          ),
        ),

        if (controller.selectedDate != null) ...[
          const SizedBox(height: 32),
          Text('Pilih Waktu', style: Get.textTheme.titleMedium),
          const SizedBox(height: 16),
          _buildTimeSlots(controller),
        ],

        if (controller.selectedTime != null) ...[
          const SizedBox(height: 32),
          Text('Pilih Stylist/Therapist', style: Get.textTheme.titleMedium),
          const SizedBox(height: 16),
          _buildStaffSelection(controller),
        ],
      ],
    );
  }

  Widget _buildTimeSlots(BookingController controller) {
    final timeSlots = [
      '09:00',
      '10:00',
      '11:00',
      '13:00',
      '14:00',
      '15:00',
      '16:00',
      '17:00',
      '18:00',
      '19:00',
      '20:00',
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: timeSlots.map((time) {
        final isSelected = controller.selectedTime == time;
        final isAvailable = controller.isTimeAvailable(time);

        return GestureDetector(
          onTap: isAvailable ? () => controller.selectTime(time) : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : (isAvailable ? Colors.white : AppColors.textLight),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : (isAvailable ? AppColors.textLight : AppColors.textLight),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              time,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: isSelected
                    ? Colors.white
                    : (isAvailable
                          ? AppColors.textPrimary
                          : AppColors.textSecondary),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStaffSelection(BookingController controller) {
    return Column(
      children: AppConstants.teamMembers.map((member) {
        final isSelected = controller.selectedStaff == member['name'];

        return GestureDetector(
          onTap: () => controller.selectStaff(member['name']!),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.textLight,
              ),
              borderRadius: BorderRadius.circular(12),
              color: isSelected
                  ? AppColors.primary.withOpacity(0.05)
                  : Colors.white,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    member['name']![0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(member['name']!, style: Get.textTheme.titleMedium),
                      Text(
                        member['position']!,
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${member['experience']} • ${member['specialty']}',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle, color: AppColors.primary),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPersonalInfo(BookingController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informasi Pribadi', style: Get.textTheme.titleLarge),
          const SizedBox(height: 24),

          TextFormField(
            controller: controller.nameController,
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
            controller: controller.phoneController,
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
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: controller.notesController,
            decoration: const InputDecoration(
              labelText: 'Catatan Khusus (Opsional)',
              prefixIcon: Icon(Icons.note),
              hintText: 'Permintaan khusus atau informasi tambahan',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),

          CheckboxListTile(
            value: controller.agreeToTerms,
            onChanged: (value) => controller.toggleTermsAgreement(),
            title: Text(
              'Saya setuju dengan syarat dan ketentuan yang berlaku',
              style: Get.textTheme.bodyMedium,
            ),
            activeColor: AppColors.primary,
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmation(BookingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Konfirmasi Reservasi', style: Get.textTheme.titleLarge),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildConfirmationRow(
                'Layanan:',
                controller.getSelectedServicesText(),
              ),
              if (controller.selectedPackage != null)
                _buildConfirmationRow('Paket:', controller.selectedPackage!),
              _buildConfirmationRow('Tanggal:', controller.getFormattedDate()),
              _buildConfirmationRow('Waktu:', controller.selectedTime ?? '-'),
              _buildConfirmationRow(
                'Stylist/Therapist:',
                controller.selectedStaff ?? '-',
              ),
              _buildConfirmationRow('Nama:', controller.nameController.text),
              _buildConfirmationRow(
                'WhatsApp:',
                controller.phoneController.text,
              ),
              if (controller.emailController.text.isNotEmpty)
                _buildConfirmationRow(
                  'Email:',
                  controller.emailController.text,
                ),
              if (controller.notesController.text.isNotEmpty)
                _buildConfirmationRow(
                  'Catatan:',
                  controller.notesController.text,
                ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.info, color: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Konfirmasi reservasi akan dikirim melalui WhatsApp dalam 15 menit setelah booking.',
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Get.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value, style: Get.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(BookingController controller) {
    return Row(
      children: [
        if (controller.currentStep > 1)
          Expanded(
            child: OutlinedButton(
              onPressed: () => controller.previousStep(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: const BorderSide(color: AppColors.primary),
              ),
              child: Text(
                'Kembali',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

        if (controller.currentStep > 1) const SizedBox(width: 16),

        Expanded(
          child: ElevatedButton(
            onPressed: controller.canProceedToNextStep()
                ? () => controller.nextStep()
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              controller.currentStep == 4 ? 'Konfirmasi Reservasi' : 'Lanjut',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
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
