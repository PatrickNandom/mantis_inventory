import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.labelName,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
















/// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String labelName;
//   final String hintText;
//   final TextEditingController? controller;

//   const CustomTextField({
//     super.key,
//     required this.labelName,
//     required this.hintText,
//     this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           labelName,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         const SizedBox(height: 10),

//         TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: hintText,
//             border: const OutlineInputBorder(
//               borderSide: BorderSide(width: 1, color: Colors.grey),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }






