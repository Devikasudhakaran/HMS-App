import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final IconData? prefixIcon;
  final double? width;
  final double? height;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    this.prefixIcon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width ?? double.infinity,
            height: height,
            child: DropdownButtonFormField<T>(
              value: value,
              items: items,
              onChanged: onChanged,
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorStyle: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
