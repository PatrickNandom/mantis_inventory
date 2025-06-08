import 'package:flutter/material.dart';
import 'package:mantis_inventory/models/user_request_model.dart';
import 'package:mantis_inventory/pages/dashboard.dart';
import 'package:mantis_inventory/pages/login_page.dart';
import 'package:mantis_inventory/services/auth_api_service.dart';
import 'package:mantis_inventory/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  final _orgNameController = TextEditingController();
  final _orgDescriptionController = TextEditingController();

  final _orgEmailController = TextEditingController();
  final _orgPhoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _authService = AuthService();

  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _orgNameController.dispose();
    _orgDescriptionController.dispose();
    _orgEmailController.dispose();
    _orgPhoneController.dispose();

    super.dispose();
  }

  void _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final userModel = UserRequestModel(
      firstName: _firstNameController.text.trim(),
      middleName: _middleNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      username: _userNameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final result = await _authService.signUp(
      _orgNameController.text.trim(),
      _orgDescriptionController.text.trim(),
      _orgEmailController.text.trim(),
      _orgPhoneController.text.trim(),
      userModel,
    );

    setState(() {
      _isLoading = false;
    });

    if (result != null) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const Dashboard()),
      );
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Signup Failed'),
          content: Text('Something went wrong'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 30, width: 30),
            SizedBox(width: 8),
            Text('Mantis', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: Colors.grey),
            ),

            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    'Organization Admin details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  Divider(thickness: 1, color: Colors.grey),
                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'First Name*',
                    hintText: 'First Name',
                    controller: _firstNameController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'First name is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Middle Name*',
                    hintText: 'Middle Name',
                    controller: _middleNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Middle name is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Last Name*',
                    hintText: 'Last Name',
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Last name is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'username*',
                    hintText: 'Userame',
                    controller: _userNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Email*',
                    hintText: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Phone*',
                    hintText: 'Phone',
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Address*',
                    hintText: 'Address',
                    controller: _addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Password*',
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Organization Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  Divider(thickness: 1, color: Colors.grey),
                  SizedBox(height: 10),

                  CustomTextField(
                    labelName: 'Organization Name*',
                    hintText: 'Organization Name',
                    controller: _orgNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Organisation name is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  CustomTextField(
                    labelName: 'Description',
                    hintText: 'Description',
                    controller: _orgDescriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide description';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  CustomTextField(
                    labelName: 'Organization Email*',
                    hintText: 'Email Address',
                    controller: _orgEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Organisation Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  CustomTextField(
                    labelName: 'Organization Phone',
                    hintText: 'Phone',
                    controller: _orgPhoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Org. phone is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: 'By Signing Up, you agree to our'),
                        TextSpan(
                          text: ' Terms of service',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(text: ' and'),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  InkWell(
                    onTap: () {
                      _handleSignUp();
                    },

                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'Create Account',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mantis_inventory/models/user_request_model.dart';
// import 'package:mantis_inventory/pages/dashboard.dart';
// import 'package:mantis_inventory/services/api_service.dart';
// import 'package:mantis_inventory/widgets/custom_text_field.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();

//   final _firstNameController = TextEditingController();
//   final _middleNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _userNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _orgNameController = TextEditingController();
//   final _orgDescriptionController = TextEditingController();
//   final _orgEmailController = TextEditingController();
//   final _orgPhoneController = TextEditingController();

//   final _authService = AuthService();

//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _middleNameController.dispose();
//     _lastNameController.dispose();
//     _userNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _passwordController.dispose();
//     _orgNameController.dispose();
//     _orgDescriptionController.dispose();
//     _orgEmailController.dispose();
//     _orgPhoneController.dispose();
//     super.dispose();
//   }

//   void _handleSignUp() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() {
//       _isLoading = true;
//     });

//     final userModel = UserRequestModel(
//       firstName: _firstNameController.text.trim(),
//       middleName: _middleNameController.text.trim(),
//       lastName: _lastNameController.text.trim(),
//       username: _userNameController.text.trim(),
//       email: _emailController.text.trim(),
//       phone: _phoneController.text.trim(),
//       address: _addressController.text.trim(),
//       password: _passwordController.text.trim(),
//     );

//     final result = await _authService.signUp(
//       _orgNameController.text.trim(),
//       _orgDescriptionController.text.trim(),
//       _orgEmailController.text.trim(),
//       _orgPhoneController.text.trim(),
//       userModel,
//     );

//     setState(() {
//       _isLoading = false;
//     });

//     if (result != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const Dashboard()),
//       );
//     } else {
//       showDialog(
//         // ignore: use_build_context_synchronously
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('Signup Failed'),
//           content: Text('Something went wrong'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               CustomTextField(
//                 hintText: 'First Name',
//                 labelName: 'First Name',
//                 controller: _firstNameController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Middle Name',
//                 labelName: 'Middle Name',
//                 controller: _middleNameController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Last Name',
//                 labelName: 'Last Name',
//                 controller: _lastNameController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Username',
//                 labelName: 'Username',
//                 controller: _userNameController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Email',
//                 labelName: 'Email',
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 validator: _emailValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Phone',
//                 labelName: 'Phone',
//                 controller: _phoneController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Address',
//                 labelName: 'Address',
//                 controller: _addressController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Password',
//                 labelName: 'Password',
//                 controller: _passwordController,
//                 obscureText: true,
//                 validator: _passwordValidator,
//               ),
//               SizedBox(height: 16),
//               CustomTextField(
//                 hintText: 'Organization Name',
//                 labelName: 'Organization Name',
//                 controller: _orgNameController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Description',
//                 labelName: 'Description',
//                 controller: _orgDescriptionController,
//                 validator: _requiredValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Org Email',
//                 labelName: 'Org Email',
//                 controller: _orgEmailController,
//                 validator: _emailValidator,
//               ),
//               CustomTextField(
//                 hintText: 'Org Phone',
//                 labelName: 'Org Phone',
//                 controller: _orgPhoneController,
//                 validator: _requiredValidator,
//               ),
//               SizedBox(height: 20),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _handleSignUp,
//                       child: Text('Create Account'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String? _requiredValidator(String? value) =>
//       value == null || value.isEmpty ? 'Required' : null;

//   String? _emailValidator(String? value) {
//     if (value == null || value.isEmpty) return 'Email is required';
//     if (!value.contains('@')) return 'Invalid email';
//     return null;
//   }

//   String? _passwordValidator(String? value) {
//     if (value == null || value.length < 6) return 'Min 6 characters';
//     return null;
//   }
// }
