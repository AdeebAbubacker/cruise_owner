import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TransactionTileShimmer extends StatelessWidget {
  const TransactionTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 85,
                  height: 30,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 12,
                    width: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 10,
                    width: 180,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 12,
              width: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
