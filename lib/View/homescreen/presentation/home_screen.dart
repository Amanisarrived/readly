import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Service/searching_service.dart';
import 'package:readly/View/bookdetailsscreen/presentation/book_details.dart';
import 'package:readly/View/homescreen/widget/search_result_tile.dart';
import 'package:readly/View/homescreen/widget/setting_screen.dart';
import 'package:readly/View/homescreen/widget/search_bar.dart';
import 'package:readly/View/homescreen/widget/Tab/tab_view_widget.dart';
import 'package:readly/Widget/ReusableWidget/shimmer_name_loading.dart';
import 'package:readly/provider/auth_provider.dart';
import 'package:readly/provider/state_provider.dart'; // ✅ Import your Book model

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchingService _searchService = SearchingService();

  Timer? _debounce;
  List<Book> _results = []; // ✅ Now strongly typed
  bool _isSearching = false;
  bool _hasSearched = false;
  final controller = TextEditingController();

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        setState(() {
          _results = [];
          _isSearching = false;
          _hasSearched = false;
        });
        return;
      }

      setState(() {
        _isSearching = true;
        _hasSearched = true;
      });

      final books = await _searchService.searchBooksAcrossCollection(query);

      setState(() {
        _results = books;
        _isSearching = false;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Load user books asynchronously
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllStateProvider>(context, listen: false).loadUserBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<AuthProvider>(context).userName;

    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        children: [
          // 👋 Greeting Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                userName == null
                    ? ShimmerNameLoading(width: 90.w, height: 18.h)
                    : Text(
                        "Hello $userName",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(fontSize: 25.sp),
                      ),
                SizedBox(width: 10.w),
                Icon(Iconsax.user_tick4, size: 23.sp),
                const Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[50],
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Iconsax.setting_2,
                      size: 23.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          // 🔍 Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchBarWidget(
              onChnaged: _onSearchChanged,
              controller: controller,
            ),
          ),

          SizedBox(height: 20.h),
          Expanded(
            child: _isSearching
                ? Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      color: Theme.of(context).primaryColor,
                      size: 50.sp,
                    ),
                  )
                : _results.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final book = _results[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookDetails(
                                  author: book.author,
                                  description: book.description,
                                  imageUrl: book.imageUrl,
                                  rating: book.rating,
                                  releaseDate: book.releaseDate,
                                  title: book.title,
                                  book: book,
                                ),
                              ),
                            );
                          },
                          child: SearchResultTile(
                            imageUrl: book.imageUrl,
                            title: book.title,
                            author: book.author,
                            rating: book.rating,
                          ),
                        ),
                      );
                    },
                  )
                : _hasSearched
                ? Padding(
                    padding: EdgeInsets.only(top: 100.w),
                    child: Column(
                      children: [
                        Image.asset("assets/images/nobook.png", height: 150.h),
                        Gap(20.h),
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Oops! No books here 📚\nTry another search 😉",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                  )
                : const TabViewWidget(),
          ),
        ],
      ),
    );
  }
}
