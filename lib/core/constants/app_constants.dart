class AppConstants {
  // Business Information
  static const String businessName = 'Salon Beauty Vibes';
  static const String tagline = 'Kecantikan & Perawatan Terpadu';
  static const String description =
      'Salon kecantikan premium dengan layanan terlengkap untuk memanjakan diri Anda';

  // Contact Information
  static const String phoneNumber = '+62 812-3456-7890';
  static const String whatsappNumber = '+62 812-3456-7890';
  static const String email = 'info@salonbeautyvibes.com';
  static const String phone = '085333242342';
  static const String instagram = '@salonbeautyvibes';
  static const String address =
      'Sadia 1 Kelurahan Sadia\nKecamatan Munda\nKota Bima - NTB';

  // Business Hours
  static const String businessHours = 'Senin - Minggu: 09.00 - 21.00 WIB';

  // Services
  static const List<Map<String, dynamic>> services = [
    {
      'id': 'haircut',
      'name': 'Potong & Styling Rambut',
      'description': 'Potong rambut trendy dengan styling profesional',
      'price': 'Mulai dari Rp 150.000',
      'duration': '60 menit',
      'category': 'Rambut',
    },
    {
      'id': 'makeup',
      'name': 'Make Up',
      'description': 'Make up untuk berbagai acara (wisuda, lamaran, dll)',
      'price': 'Mulai dari Rp 300.000',
      'duration': '90 menit',
      'category': 'Make Up',
    },
    {
      'id': 'skincare',
      'name': 'Perawatan Wajah',
      'description': 'Treatment wajah untuk kulit sehat dan glowing',
      'price': 'Mulai dari Rp 200.000',
      'duration': '75 menit',
      'category': 'Skincare',
    },
    {
      'id': 'nails',
      'name': 'Nail Art & Manicure',
      'description': 'Perawatan kuku dengan nail art menarik',
      'price': 'Mulai dari Rp 100.000',
      'duration': '45 menit',
      'category': 'Nail Art',
    },
    {
      'id': 'spa',
      'name': 'Spa & Massage',
      'description': 'Relaksasi tubuh dengan pijat dan spa treatment',
      'price': 'Mulai dari Rp 400.000',
      'duration': '120 menit',
      'category': 'Body Treatment',
    },
  ];

  // Packages
  static const List<Map<String, dynamic>> packages = [
    {
      'id': 'wedding',
      'name': 'Paket Wedding',
      'description': 'Paket lengkap untuk hari bahagia Anda',
      'price': 'Mulai dari Rp 2.500.000',
      'includes': [
        'Make Up Pengantin',
        'Hair Do',
        'Manicure Pedicure',
        'Spa Treatment',
      ],
    },
    {
      'id': 'glowup',
      'name': 'Paket Glow Up',
      'description': 'Transformasi total untuk tampil percaya diri',
      'price': 'Mulai dari Rp 800.000',
      'includes': ['Facial Treatment', 'Make Up', 'Hair Styling', 'Nail Art'],
    },
  ];

  // Team Members
  static const List<Map<String, String>> teamMembers = [
    {
      'name': 'Sarah Wijaya',
      'position': 'Senior Hair Stylist',
      'experience': '8+ tahun pengalaman',
      'specialty': 'Hair Cutting & Coloring',
    },
    {
      'name': 'Maya Sari',
      'position': 'Make Up Artist',
      'experience': '6+ tahun pengalaman',
      'specialty': 'Bridal Make Up',
    },
    {
      'name': 'Linda Chen',
      'position': 'Skin Care Specialist',
      'experience': '5+ tahun pengalaman',
      'specialty': 'Facial Treatment',
    },
  ];
}
