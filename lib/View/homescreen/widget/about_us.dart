import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // App Logo
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/app_icon_readly.png",
                ),
              ),
            ),
            const SizedBox(height: 20),

            // App Name
            Center(
              child: Text(
                "Readly",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 10),

            // Mission
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Readly is a modern reading companion bringing the best of "
                  "Fantasy, Romance, Thriller and more – all in one place.\n\n"
                  "Our mission is to make books more accessible, engaging, "
                  "and enjoyable for readers worldwide.",
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Vision
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "✨ Built with passion by an independent developer.\n"
                  "📚 Always improving. Always adding more books.\n"
                  "🚀 On a journey to build the best reading platform.",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Contact
            const Center(
              child: Column(
                children: [
                  Text("Contact Us:"),
                  SizedBox(height: 5),
                  Text(
                    "adevkota448@gmail.com",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
