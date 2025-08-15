import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';

class EpubReaderScreen extends StatelessWidget {
  final String epubUrl;
  final String title;

  const EpubReaderScreen({
    super.key,
    required this.epubUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await EpubSource.fromUrl(epubUrl);
          },
          child: const Text("Open Book"),
        ),
      ),
    );
  }
}
