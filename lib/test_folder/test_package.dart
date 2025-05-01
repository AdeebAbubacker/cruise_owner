import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/package_details_box.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';

class TestPackage extends StatelessWidget {
  const TestPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stored Packages')),
      body: ValueListenableBuilder(
        valueListenable: packageDetailsBox.listenable(),
        builder: (context, box, _) {
          final items = box.values.toList();

          if (items.isEmpty) {
            return const Center(child: Text('No packages stored.'));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return ListTile(
                leading: (item.cruiseImage ?? '').isNotEmpty
                    ? Image.network(item.cruiseImage!)
                    : const Icon(Icons.image_not_supported),
                title: Text('Package ID: ${item.packageId ?? "N/A"} ${item.cruiseName ?? "N/A"} ${item.packageName ?? "N/A"}'),
              );
            },
          );
        },
      ),
    );
  }
}
