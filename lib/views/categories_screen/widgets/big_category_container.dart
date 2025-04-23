import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigCategoryContainer extends StatefulWidget {
  final List<String> titles;
  final List<String> images;
  final List<String> numbers;

  const BigCategoryContainer({
    super.key,
    required this.titles,
    required this.images,
    required this.numbers,
  });

  @override
  State<BigCategoryContainer> createState() => _BigCategoryContainerState();
}

class _BigCategoryContainerState extends State<BigCategoryContainer> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  final double _itemWidth = 345.w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Container(
        height: 370.h,
        width: 345.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.w),
          color: Color.fromARGB(255, 160, 161, 162),
        ),
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification) {
                    final page =
                        (_scrollController.offset / _itemWidth).round();
                    setState(() {
                      _currentIndex = page;
                    });
                  }
                  return false;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.titles.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: _itemWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(widget.images[index], height: 200.h),
                          Text(
                            widget.titles[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          ),
                          Text(
                            widget.numbers[index],
                            style: TextStyle(fontSize: 22.sp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Page Indicator
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.titles.length, (index) {
                  return Container(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
