import 'package:flutter/material.dart';

class TreatmentCard extends StatelessWidget {
  final int? index;
  final String? title;
  final int? maleCount;
  final int? femaleCount;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  const TreatmentCard({
    super.key,
     this.index,
     this.title,
     this.maleCount,
     this.femaleCount,
     this.onEdit,
     this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${index! + 1}.  $title",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: onRemove,
                ),
              ],
            ),
            Row(
              children: [
                Chip(
                  label: Text("Male $maleCount"),
                  backgroundColor: Colors.green.shade50,
                ),
                const SizedBox(width: 10),
                Chip(
                  label: Text("Female $femaleCount"),
                  backgroundColor: Colors.green.shade50,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: onEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
