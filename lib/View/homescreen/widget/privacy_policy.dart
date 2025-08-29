import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              const Text(
                "Last updated: August 2025\n",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              const Text(
                "1. Information We Collect",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "We collect basic user data such as email, profile information, "
                "and app usage analytics to improve user experience.",
              ),
              const SizedBox(height: 20),

              const Text(
                "2. How We Use Your Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your information is used for account creation, book "
                "recommendations, bug fixes, and feature improvements.",
              ),
              const SizedBox(height: 20),

              const Text(
                "3. Data Sharing",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "We do not sell or rent your data. Data is only shared with "
                "trusted third-party services such as Google Firebase "
                "for authentication and analytics.",
              ),
              const SizedBox(height: 20),

              const Text(
                "4. Security",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "We take reasonable steps to protect your information. "
                "However, no online service can be 100% secure.",
              ),
              const SizedBox(height: 20),

              const Text(
                "5. Your Choices",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "You can delete your account or request removal of your data "
                "at any time by contacting us.",
              ),
              const SizedBox(height: 20),

              const Text(
                "6. Contact Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                "If you have any questions about this Privacy Policy, "
                "please contact us at:\n\nsupport@readly.com",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
