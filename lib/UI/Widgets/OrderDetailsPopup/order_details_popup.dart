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
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          'Booking Details',
          style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Optional: QR code
          // You can re-enable this block if needed

          Text(
            'Order ID: ${booking.orderId.toString()}',
            style:
                GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          _infoRow('Name', booking.user?.name ?? 'N/A'),
          _infoRow('Email', booking.user?.email ?? 'N/A'),
          _infoRow('Phone', booking.user?.phoneNumber ?? 'N/A'),
          _infoRow('Veg',
              booking.vegCount != null ? booking.vegCount.toString() : 'N/A'),
          _infoRow(
              'Non Veg',
              booking.nonVegCount != null
                  ? booking.nonVegCount.toString()
                  : 'N/A'),
          _infoRow(
              'Jain Veg',
              booking.jainVegCount != null
                  ? booking.jainVegCount.toString()
                  : 'N/A'),
          _infoRow('Add on', booking.customerNote ?? '(No Add ons)'),
          _infoRow('Total', '₹${booking.totalAmount ?? 'N/A'}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Close',
            style: GoogleFonts.ubuntu(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.ubuntu(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
