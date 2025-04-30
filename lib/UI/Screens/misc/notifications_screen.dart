import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(width: 16),
                  const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _sectionHeader("Today"),
                  _notificationItem(
                    icon: Icons.close,
                    iconBgColor: Colors.grey.shade300,
                    title: "Booking Cancelled",
                    subtitle:
                        'Your booking for "Tranquil Waters" on Dec 3, 2024, has been cancelled.',
                    time: "3 hours ago",
                  ),
                  _notificationItem(
                    icon: Icons.check_circle,
                    iconBgColor: Colors.green.shade100,
                    title: "Booking Confirmed",
                    subtitle:
                        'Your houseboat "Serenity Cruise" is booked for Dec 5, 2024.',
                    time: "5 hours ago",
                  ),
                  const SizedBox(height: 20),
                  _sectionHeader("Yesterday"),
                  _notificationItem(
                    icon: Icons.payment,
                    iconBgColor: Colors.blue.shade100,
                    title: "Payment Received",
                    subtitle:
                        "₹12,000 has been successfully paid for your booking.",
                    time: "Yesterday",
                  ),
                  _notificationItem(
                    icon: Icons.check_circle,
                    iconBgColor: Colors.green.shade100,
                    title: "Booking Confirmed",
                    subtitle:
                        'Your houseboat "Serenity Cruise" is booked for Dec 5, 2024.',
                    time: "5 hours ago",
                  ),
                ],
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("Mark all read",
              style: TextStyle(color: Colors.blue.shade700, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _notificationItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Circle
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBgColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, size: 20),
          ),
          const SizedBox(width: 12),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(fontSize: 13, height: 1.4)),
                const SizedBox(height: 4),
                Text(time,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
