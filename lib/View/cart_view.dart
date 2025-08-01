// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:readly/Model/book_card.dart';
import 'package:readly/Widget/BookWidgets/cart_card.dart';
import 'package:readly/provider/state_provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> cartBooks = Provider.of<AllStateProvider>(
      context,
    ).cartBooks;
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cart", style: Theme.of(context).textTheme.bodyLarge),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.menu,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 2,
            height: 20.h,
          ),
          cartBooks.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(
                          "assets/images/empty_ghost.json",
                          animate: false,
                          width: 200.w,
                          height: 120.h,
                        ),
                      ),
                      Text(
                        "No Books Found!",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: cartBooks.length,
                    itemBuilder: (context, index) {
                      final book = cartBooks[index];
                      return CartCard(
                        imageUrl: book.imageUrl,
                        title: book.title,
                        author: book.author,
                        catogery: book.catogery,
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
