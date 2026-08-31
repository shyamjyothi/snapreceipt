import 'package:flutter/material.dart';

import 'receipts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapReceipt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Blue Theme Setup
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2), // Primary Blue
          primary: const Color(0xFF1976D2),
          secondary: const Color(0xFF0288D1),
        ),
        scaffoldBackgroundColor: const Color(
          0xFFF5F9FF,
        ), // Very soft blue tint tint
      ),
      home: const GuestHomePage(),
    );
  }
}

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SnapReceipt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // Hero Illustration / Icon Container
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      size: 90,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    Icon(
                      Icons.document_scanner_outlined,
                      size: 32,
                      color: theme.colorScheme.secondary,
                    ),
                  ],
                ),
              ),

              // App Title & Tagline
              Column(
                children: [
                  Text(
                    'Smart Receipt Tracking',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D47A1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Scan paper receipts instantly. SnapReceipt automatically tags the store name, date, and spending total so you never lose track.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Feature Highlights List
              // Feature Highlights Container
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xFF1976D2),
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Instant Camera Scanning',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Set directly inline
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.label_outline,
                          color: Color(0xFF1976D2),
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Auto-tag Merchant & Totals',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Set directly inline
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Color(0xFF1976D2),
                          size: 22,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Secure Cloud Storage',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // Set directly inline
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Login / Sign In Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecentReceiptsScreen(),
                      ),
                    );

                    //ScaffoldMessenger.of(context).showSnackBar(
                    //const SnackBar(content: Text('Navigate to Login Screen')),
                    //);
                  },
                  child: const Text(
                    'Log In / Get Started',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper Widget for Feature List Rows
class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF1976D2), size: 22),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
