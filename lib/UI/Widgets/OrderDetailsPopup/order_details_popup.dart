import 'package:cruise_buddy/core/model/get_my_booking_list/get_my_booking_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BookingDetailsPopup extends StatelessWidget {
  final BookingData booking;
  final GlobalKey qrKey;

  const BookingDetailsPopup({
    super.key,
    required this.booking,
    required this.qrKey,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          'Booking Details',
          style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // QR Code
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: RepaintBoundary(
              key: qrKey,
              child: QrImageView(
                data: booking.orderId.toString(),
                version: QrVersions.auto,
                size: 100,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Text(
            'Order ID: ${booking.orderId.toString()}',
            style:
                GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  booking.user?.name.toString() ?? "N/A",
                  style: GoogleFonts.ubuntu(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.email, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  booking.user?.email.toString() ?? "N/A",
                  style: GoogleFonts.ubuntu(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.phone, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  booking.user?.phoneNumber.toString() ?? "N/A",
                  style: GoogleFonts.ubuntu(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Total: ₹${booking.totalAmount.toString() ?? "N/A"}',
                  style: GoogleFonts.ubuntu(),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Close',
            style: GoogleFonts.ubuntu(color: Colors.red),
          ),
        )
      ],
    );
  }
}
