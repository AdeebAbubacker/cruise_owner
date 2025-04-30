import 'package:cruise_buddy/UI/Screens/Auth/login_screens.dart';
import 'package:flutter/material.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyBoats = [
      {
        'name': 'Sea Breeze',
        'location': 'Miami, FL',
        'image':
            'https://beautifulalleppey.com/wp-content/uploads/2024/05/Outside-Night-view.jpg',
      },
      {
        'name': 'Ocean Explorer',
        'location': 'San Diego, CA',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaaJOPXTMQQmtpsRhpcwl-FQ19lehCVU6BcA&s',
      },
      {
        'name': 'Golden Wave',
        'location': 'Dubai Marina',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaHKu163EHYPfzS8YHw8b3eotwcHZdYfwfsA&s',
      },
      {
        'name': 'Blue Horizon',
        'location': 'Sydney, Australia',
        'image':
            'https://serviettehotels.com/wp-content/uploads/2020/10/Serviette-Houseboat-Experience-Kumarakom-Kerala-2.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: const Text('Cruise Buddy'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Explore as Guest 👋',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Preview available boats, pricing, and locations. Log in for full features!',
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),

          const SizedBox(height: 24),

          // Dummy listings
          const Text(
            'Popular Boats',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),

          ...dummyBoats.map((boat) => _buildBoatCard(boat)).toList(),

          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Log in'),
          ),
        ],
      ),
    );
  }

  Widget _buildBoatCard(Map<String, String> boat) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              boat['image']!,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  boat['name']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  boat['location']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
