import 'package:flutter/material.dart';
import 'package:mantis_inventory/pages/login_page.dart';
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
                ),

                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'Middle Name*',
                  hintText: 'Middle Name',
                  controller: _middleNameController,
                ),

                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'Last Name*',
                  hintText: 'Last Name',
                  controller: _lastNameController,
                ),

                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'username*',
                  hintText: 'Userame',
                  controller: _userNameController,
                ),

                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'Email*',
                  hintText: 'Email Address',
                  controller: _emailController,
                ),

                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'Phone*',
                  hintText: 'Phone',
                  controller: _phoneController,
                ),

                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'Address*',
                  hintText: 'Address',
                  controller: _addressController,
                ),
                SizedBox(height: 10),

                CustomTextField(
                  labelName: 'Password*',
                  hintText: 'Password',
                  controller: _passwordController,
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
                ),

                SizedBox(height: 10),
                CustomTextField(
                  labelName: 'Description',
                  hintText: 'Description',
                  controller: _orgDescriptionController,
                ),

                SizedBox(height: 10),
                CustomTextField(
                  labelName: 'Organization Email*',
                  hintText: 'Email Address',
                  controller: _orgEmailController,
                ),

                SizedBox(height: 10),
                CustomTextField(
                  labelName: 'Organization Phone',
                  hintText: 'Phone',
                  controller: _orgPhoneController,
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
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
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
    );
  }
}
