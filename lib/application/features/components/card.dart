import 'package:flutter/material.dart';
class BookingCard extends StatelessWidget {
  final int index;
  const BookingCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$index. Vikram Singh", style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              "Couple Combo Package (Rejuven...",
              style: TextStyle(color: Colors.green),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.calendar_today, size: 16, color: Colors.red),
                SizedBox(width: 4),
                Text("31/01/2024"),
                SizedBox(width: 16),
                Icon(Icons.people, size: 16, color: Colors.brown),
                SizedBox(width: 4),
                Text("Jithesh"),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("View Booking details", style: TextStyle(fontWeight: FontWeight.w500)),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
