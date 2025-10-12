import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Current Step
  int currentStep = 1;

  // Selected Services
  List<String> selectedServices = [];
  String? selectedPackage;

  // Date and Time
  DateTime? selectedDate;
  String? selectedTime;
  String? selectedStaff;

  // Personal Information Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  // Terms Agreement
  bool agreeToTerms = false;

  // Available Time Slots (mock data - should come from backend)
  Map<String, List<String>> availableSlots = {
    '09:00': ['Sarah Wijaya', 'Maya Sari'],
    '10:00': ['Linda Chen', 'Sarah Wijaya'],
    '11:00': ['Maya Sari', 'Linda Chen'],
    '13:00': ['Sarah Wijaya', 'Maya Sari', 'Linda Chen'],
    '14:00': ['Maya Sari', 'Linda Chen'],
    '15:00': ['Sarah Wijaya', 'Linda Chen'],
    '16:00': ['Maya Sari', 'Sarah Wijaya'],
    '17:00': ['Linda Chen', 'Maya Sari'],
    '18:00': ['Sarah Wijaya'],
    '19:00': ['Maya Sari'],
    '20:00': ['Linda Chen'],
  };

  void toggleService(String serviceId) {
    if (selectedServices.contains(serviceId)) {
      selectedServices.remove(serviceId);
    } else {
      selectedServices.add(serviceId);
      // Clear package selection if individual service is selected
      selectedPackage = null;
    }
    update();
  }

  void selectPackage(String packageId) {
    if (selectedPackage == packageId) {
      selectedPackage = null;
    } else {
      selectedPackage = packageId;
      // Clear individual services if package is selected
      selectedServices.clear();
    }
    update();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    selectedTime = null; // Reset time when date changes
    selectedStaff = null; // Reset staff when date changes
    update();
  }

  void selectTime(String time) {
    selectedTime = time;
    selectedStaff = null; // Reset staff when time changes
    update();
  }

  void selectStaff(String staff) {
    selectedStaff = staff;
    update();
  }

  bool isTimeAvailable(String time) {
    // Mock availability check - should check with backend
    return availableSlots.containsKey(time) && availableSlots[time]!.isNotEmpty;
  }

  void nextStep() {
    if (currentStep < 4) {
      if (currentStep == 3 &&
          formKey.currentState!.validate() &&
          agreeToTerms) {
        currentStep++;
      } else if (currentStep != 3) {
        currentStep++;
      }
      update();
    } else {
      // Submit booking
      _submitBooking();
    }
  }

  void previousStep() {
    if (currentStep > 1) {
      currentStep--;
      update();
    }
  }

  bool canProceedToNextStep() {
    switch (currentStep) {
      case 1:
        return selectedServices.isNotEmpty || selectedPackage != null;
      case 2:
        return selectedDate != null &&
            selectedTime != null &&
            selectedStaff != null;
      case 3:
        return nameController.text.isNotEmpty &&
            phoneController.text.isNotEmpty &&
            agreeToTerms;
      case 4:
        return true;
      default:
        return false;
    }
  }

  void toggleTermsAgreement() {
    agreeToTerms = !agreeToTerms;
    update();
  }

  String getSelectedServicesText() {
    if (selectedPackage != null) {
      return selectedPackage!;
    }
    return selectedServices.join(', ');
  }

  String getFormattedDate() {
    if (selectedDate == null) return '-';
    try {
      return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(selectedDate!);
    } catch (e) {
      // Fallback ke format default jika locale tidak tersedia
      return DateFormat('EEEE, dd MMMM yyyy').format(selectedDate!);
    }
  }

  void _submitBooking() {
    // Show loading
    Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text('Memproses reservasi...', style: Get.textTheme.bodyLarge),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Close loading dialog

      // Show success dialog
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 28),
              const SizedBox(width: 12),
              Text('Reservasi Berhasil!'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terima kasih ${nameController.text}! Reservasi Anda telah berhasil dibuat.',
                style: Get.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Konfirmasi akan dikirim ke WhatsApp ${phoneController.text} dalam 15 menit.',
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog
                Get.offAllNamed('/'); // Go to home
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
