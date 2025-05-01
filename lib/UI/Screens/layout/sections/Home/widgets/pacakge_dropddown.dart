import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:flutter/material.dart';

// class PackageDropdownItem extends StatelessWidget {
//   final PackageDetailsDB package;

//   const PackageDropdownItem({Key? key, required this.package})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Package Image
//         ClipRRect(
//           borderRadius: BorderRadius.circular(6),
//           child: package.cruiseImage != null
//               ? Image.network(
//                   package.cruiseImage!,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 )
//               : const Icon(Icons.image_not_supported, size: 50),
//         ),
//         const SizedBox(width: 10),

//         // Package Info
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 package.packageName ?? 'No package name',
//                 style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//               Text(
//                 package.cruiseName ?? 'Unknown Cruise',
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class PackageDropdownItem extends StatelessWidget {
  final PackageDetailsDB package;
  final String? bookingTypeId;

  const PackageDropdownItem({
    Key? key,
    required this.package,
    this.bookingTypeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${package.packageName ?? 'No package name'} - Booking Type: ${bookingTypeId ?? 'N/A'}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
      ],
    );
  }
}

class PackageBookingSelection {
  final PackageDetailsDB package;
  final String bookingTypeId;

  PackageBookingSelection(this.package, this.bookingTypeId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PackageBookingSelection &&
          runtimeType == other.runtimeType &&
          package.packageId == other.package.packageId &&
          bookingTypeId == other.bookingTypeId;

  @override
  int get hashCode => package.packageId.hashCode ^ bookingTypeId.hashCode;
}
