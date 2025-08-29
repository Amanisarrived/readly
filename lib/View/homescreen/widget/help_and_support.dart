import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  DateTime? _lastSubmitted;

  bool _loading = false;
  String? _messageError; // ✅ store message error separately

  // ✅ Email Validator
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _saveFeedback() async {
    // check cooldown
    if (_lastSubmitted != null) {
      final difference = DateTime.now().difference(_lastSubmitted!);
      if (difference.inMinutes < 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "⏳ Please wait ${5 - difference.inMinutes} min(s) before sending again.",
              style: TextStyle(fontSize: 12.sp), // smaller snackbar text
            ),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
          ),
        );
        return;
      }
    }

    setState(() => _loading = true);

    await FirebaseFirestore.instance.collection('feedbacks').add({
      'name': _nameController.text,
      'email': _emailController.text,
      'message': _messageController.text,
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      _loading = false;
      _lastSubmitted = DateTime.now(); // store latest submit time
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        content: Text(
          "✅ Feedback submitted!",
          style: TextStyle(fontSize: 12.sp),
        ),
        backgroundColor: Colors.green,
      ),
    );

    // reset + clear fields
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    setState(() => _messageError = null); // clear error
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.blueAccent, size: 20),
      labelText: label,
      labelStyle: const TextStyle(fontSize: 13, color: Colors.black87),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help & Support",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Theme(
            // ✅ Apply smaller error text globally
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                errorStyle: TextStyle(
                  fontSize: 11.sp, // smaller error font
                  color: Colors.red,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We’re here to help 👋",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Have questions or feedback? Fill out the form below.",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 20.h),

                // Name field
                TextFormField(
                  controller: _nameController,
                  style: TextStyle(fontSize: 14.sp),
                  decoration: _inputDecoration("Your Name", Icons.person),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter your name" : null,
                ),
                SizedBox(height: 14.h),

                // Email field
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 14.sp),
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration("Your Email", Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!_isValidEmail(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14.h),

                // ✅ Message box (error outside)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _messageController,
                        style: TextStyle(fontSize: 14.sp),
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Write your message...",
                          hintStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 14.h,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            setState(
                              () => _messageError = "Please enter your message",
                            );
                            return "";
                          }
                          setState(() => _messageError = null);
                          return null;
                        },
                      ),
                    ),
                    if (_messageError != null)
                      Padding(
                        padding: EdgeInsets.only(top: 4.h, left: 4.w),
                        child: Text(
                          _messageError!,
                          style: TextStyle(fontSize: 11.sp, color: Colors.red),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 22.h),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  height: 46.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: _loading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _saveFeedback();
                            }
                          },
                    child: _loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Send Feedback",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
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
