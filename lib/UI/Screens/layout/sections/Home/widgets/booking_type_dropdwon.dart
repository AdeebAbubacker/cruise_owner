import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:flutter/material.dart';

import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:flutter/material.dart';

class BookingTypeDropdown extends StatelessWidget {
  final PackageDetailsDB package;

  const BookingTypeDropdown({Key? key, required this.package})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Package Image
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: package.cruiseImage != null
              ? Image.network(
                  package.cruiseImage!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.image_not_supported, size: 50),
        ),
        const SizedBox(width: 10),

        // Package Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                package.packageName ?? 'No package name',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                package.cruiseName ?? 'Unknown Cruise',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),

        // Booking Type Dropdown (Single Dropdown)
        DropdownButton<int>(
          value: package.bookingTypeIds != null &&
                  package.bookingTypeIds!.isNotEmpty
              ? int.tryParse(package.bookingTypeIds!.first) ?? 1
              : 1, // Default to 1 if no valid value
          items: [
            DropdownMenuItem<int>(
              value: 1,
              child: Row(
                children: const [
                  Icon(Icons.wb_sunny, size: 20), // Sun icon for Day Cruise
                  SizedBox(width: 8),
                  Text('Day Cruise'),
                ],
              ),
            ),
            DropdownMenuItem<int>(
              value: 2,
              child: Row(
                children: const [
                  Icon(Icons.nights_stay,
                      size: 20), // Moon icon for Full Day Cruise
                  SizedBox(width: 8),
                  Text('Full Day Cruise'),
                ],
              ),
            ),
          ],
          onChanged: (int? newValue) {
            // Handle the change in bookingTypeId if needed
            if (newValue != null) {
              // Update the bookingTypeId in Hive (only if needed)
              // For example, you can use Hive's put method to update the value in the box
            }
          },
        ),
      ],
    );
  }
}
