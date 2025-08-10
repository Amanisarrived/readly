import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/viewallpage/widgets/grid_tile.dart';
import 'package:readly/provider/genre_provider.dart';

class ViewallScreen extends StatefulWidget {
  const ViewallScreen({
    required this.collectionName,
    required this.genreName,
    super.key,
  });

  final String genreName;
  final String collectionName;

  @override
  State<ViewallScreen> createState() => _ViewallScreenState();
}

class _ViewallScreenState extends State<ViewallScreen> {
  @override
  void initState() {
    super.initState();
    final genreProvider = Provider.of<GenreProvider>(context, listen: false);
    genreProvider.fetchBooksByGenre(widget.collectionName);
  }

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenreProvider>(context);
    final books = genreProvider.getBooksByGenre(widget.collectionName);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,

        toolbarHeight: 50.h,
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(widget.genreName),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: GridTileWidget(books: books),
    );
  }
}
