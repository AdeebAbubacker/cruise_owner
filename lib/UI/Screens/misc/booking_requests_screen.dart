import 'package:flutter/material.dart';

class BookingRequestsScreen extends StatelessWidget {
  const BookingRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Booking Requests",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Today Section
              _sectionHeader("Today"),
              _bookingItem(
                name: "John",
                image: "https://i.pravatar.cc/150?img=1",
                timeAgo: "5 hours ago",
                status: "Booking Request",
                subtext:
                    'John send request for "Serenity Cruise" is booked on Dec 5, 2024.',
                isPending: true,
              ),
              _bookingItem(
                name: "Serina",
                image: "https://i.pravatar.cc/150?img=2",
                timeAgo: "5 hours ago",
                status: "Booking Request",
                subtext:
                    'Serina send request for "Serenity Cruise" is booked on Dec 5, 2024.',
                isPending: true,
              ),

              const SizedBox(height: 16),

              // Yesterday Section
              _sectionHeader("Yesterday"),
              _bookingItem(
                name: "Shawn",
                image: "https://i.pravatar.cc/150?img=3",
                timeAgo: "29 hours ago",
                status: "Booking Request Approved",
                subtext:
                    'Shawn send request for "Serenity Cruise" is booked on Dec 5, 2024.',
                isApproved: true,
              ),
              _bookingItem(
                name: "Naila",
                image: "https://i.pravatar.cc/150?img=4",
                timeAgo: "29 hours ago",
                status: "Booking Request Cancelled",
                subtext:
                    'Naila send request for "Serenity Cruise" is booked on Dec 5, 2024.',
                isCancelled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
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

  Widget _bookingItem({
    required String name,
    required String image,
    required String timeAgo,
    required String status,
    required String subtext,
    bool isPending = false,
    bool isApproved = false,
    bool isCancelled = false,
  }) {
    Color statusColor = isCancelled
        ? Colors.red
        : isApproved
            ? Colors.green
            : Colors.blue;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtext,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  timeAgo,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          if (isPending) ...[
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red, size: 18),
                  onPressed: () {},
                ),
                Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 9,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.green, size: 18),
                  onPressed: () {},
                ),
                Text(
                  "Approve",
                  style: TextStyle(
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}
