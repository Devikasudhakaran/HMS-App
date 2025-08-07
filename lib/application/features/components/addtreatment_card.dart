
import 'package:flutter/material.dart';
void showAddTreatmentDialog(BuildContext context) {
  int maleCount = 0;
  int femaleCount = 0;
  String? selectedTreatment;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Choose Treatment", style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedTreatment,
                  hint: const Text("Choose preferred treatment"),
                  items: ["Combo Package", "Spa", "Massage", "Therapy"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedTreatment = val;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Male"),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.green),
                          onPressed: () => setState(() => maleCount = maleCount > 0 ? maleCount - 1 : 0),
                        ),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: Text("$maleCount"),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () => setState(() => maleCount++),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Female"),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.green),
                          onPressed: () => setState(() => femaleCount = femaleCount > 0 ? femaleCount - 1 : 0),
                        ),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: Text("$femaleCount"),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () => setState(() => femaleCount++),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // You can now add this treatment to the list or call a callback
                  },
                  child: const Text("Save", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        );
      });
    },
  );
}
