// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SupplierDropdown extends StatefulWidget {
  final List<String> suppliers;
  final Function(String?) onSelected;
  final String labelText;

  const SupplierDropdown({
    super.key,
    required this.suppliers,
    required this.onSelected,
    required this.labelText,
  });

  @override
  State<SupplierDropdown> createState() => _SupplierDropdownState();
}

class _SupplierDropdownState extends State<SupplierDropdown> {
  String? selectedSupplier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: 'Search for supplier',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
          value: selectedSupplier,
          onChanged: (value) {
            setState(() {
              selectedSupplier = value;
            });
            widget.onSelected(value);
          },
          items: widget.suppliers.map((supplier) {
            return DropdownMenuItem(value: supplier, child: Text(supplier));
          }).toList(),
        ),
      ],
    );
  }
}
