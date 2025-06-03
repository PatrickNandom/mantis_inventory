import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextAndDatePickerColumn extends StatefulWidget {
  final String displayText;

  const TextAndDatePickerColumn({super.key, required this.displayText});

  @override
  // ignore: library_private_types_in_public_api
  _TextAndDatePickerColumnState createState() =>
      _TextAndDatePickerColumnState();
}

class _TextAndDatePickerColumnState extends State<TextAndDatePickerColumn> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String dateText = selectedDate == null
        ? 'dd/mm/yyyy'
        : DateFormat('dd/MM/yyyy').format(selectedDate!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.displayText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateText,
                  style: TextStyle(
                    color: selectedDate == null ? Colors.grey : Colors.black,
                    fontSize: 16,
                  ),
                ),

                SizedBox(width: 9),
                const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
