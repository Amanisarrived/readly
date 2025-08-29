import 'dart:io';
import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SimpleEpubReader extends StatefulWidget {
  final String epubUrl;
  final String title;

  const SimpleEpubReader({
    super.key,
    required this.epubUrl,
    required this.title,
  });

  @override
  State<SimpleEpubReader> createState() => _SimpleEpubReaderState();
}

class _SimpleEpubReaderState extends State<SimpleEpubReader> {
  EpubController? _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEpub();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _loadEpub() async {
    try {
      final response = await http.get(Uri.parse(widget.epubUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to download EPUB');
      }

      setState(() {
        // ✅ load directly from bytes, no File conversion
        _controller = EpubController(
          document: EpubDocument.openData(response.bodyBytes),
        );
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error loading EPUB: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                color: Theme.of(context).primaryColor,
                size: 50.sp,
              ),
            )
          : _controller == null
          ? const Center(child: Text("Failed to load EPUB"))
          : EpubView(controller: _controller!),
    );
  }
}
