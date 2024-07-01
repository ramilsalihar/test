import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/widgets/app_card.dart';
import 'package:test/widgets/app_search_bar.dart';
import 'package:test/widgets/custom_app_bar.dart';

import 'dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const AppSearchBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount(context),
                  crossAxisSpacing: 8.0.w,
                  mainAxisSpacing: 8.0.h,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return AppCard(
                    title: item['title'],
                    color: Color(item['color']),
                  );
                },
                itemCount: data.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 2; // Mobile
    } else if (width < 1200) {
      return 4; // Tablet
    } else {
      return 6; // Web
    }
  }
}
