// lib/recent_receipts_screen.dart
import 'package:flutter/material.dart';

import 'scan.dart';

class RecentReceiptsScreen extends StatelessWidget {
  const RecentReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> recentReceipts = [
      {
        'store': 'Target',
        'date': 'AUG 28, 2026',
        'total': '\$124.50',
        'icon': Icons.shopping_bag_outlined,
      },
      {
        'store': 'Starbucks',
        'date': 'AUG 27, 2026',
        'total': '\$6.85',
        'icon': Icons.local_cafe_outlined,
      },
      {
        'store': 'Trader Joe\'s',
        'date': 'AUG 25, 2026',
        'total': '\$89.30',
        'icon': Icons.shopping_cart_outlined,
      },
      {
        'store': 'Shell Oil',
        'date': 'AUG 24, 2026',
        'total': '\$45.00',
        'icon': Icons.local_gas_station_outlined,
      },
      {
        'store': 'Apple Store',
        'date': 'AUG 20, 2026',
        'total': '\$1,299.00',
        'icon': Icons.devices_outlined,
      },
      {
        'store': 'CVS Pharmacy',
        'date': 'AUG 18, 2026',
        'total': '\$24.15',
        'icon': Icons.medical_services_outlined,
      },
      {
        'store': 'Home Depot',
        'date': 'AUG 15, 2026',
        'total': '\$156.40',
        'icon': Icons.home_repair_service_outlined,
      },
      {
        'store': 'Best Buy',
        'date': 'AUG 12, 2026',
        'total': '\$84.99',
        'icon': Icons.tv_outlined,
      },
      {
        'store': 'Whole Foods',
        'date': 'AUG 10, 2026',
        'total': '\$112.20',
        'icon': Icons.shopping_cart_outlined,
      },
      {
        'store': 'Uber',
        'date': 'AUG 08, 2026',
        'total': '\$18.50',
        'icon': Icons.directions_car_outlined,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: const Text(
          'SnapReceipt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Spend Summary Header
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back, User! 👋',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'August Spending Total',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        '\$1,960.89',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Recent Receipts List Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RECENT RECEIPTS (TOP 10)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: Colors.black54,
                    ),
                  ),
                  Icon(
                    Icons.filter_list_rounded,
                    color: Color(0xFF1976D2),
                    size: 20,
                  ),
                ],
              ),
            ),

            // Top 10 Recent Receipts List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: recentReceipts.length,
                itemBuilder: (context, index) {
                  final receipt = recentReceipts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 6.0,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F9FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          receipt['icon'],
                          color: const Color(0xFF1976D2),
                          size: 24,
                        ),
                      ),
                      title: Text(
                        receipt['store'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        receipt['date'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            receipt['total'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0D47A1),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Icon(
                            Icons.check_circle_outline_rounded,
                            size: 16,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final String? imagePath = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScanReceiptScreen()),
          );

          if (imagePath != null && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Receipt captured successfully!'),
                backgroundColor: Color(0xFF1976D2),
              ),
            );
          }
        },
        backgroundColor: const Color(0xFF1976D2),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.camera_alt_outlined),
        label: const Text(
          'Scan +',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF1976D2),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
