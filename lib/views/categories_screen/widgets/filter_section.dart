import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterChipsSection extends StatefulWidget {
  final Function(String) onFilterChanged;

  const FilterChipsSection({
    super.key,
    required this.onFilterChanged,
  });

  @override
  State<FilterChipsSection> createState() => _FilterChipsSectionState();
}

class _FilterChipsSectionState extends State<FilterChipsSection> {
  final List<String> filters = [
    'View all',
    'Best rated',
    'Expensive first',
    'Cheapest first',
    'Count low',
    'Count high',
  ];
  String selectedFilter = 'View all';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Row(
              children: [
                Text(
                  'SPEAKERS',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (context, index) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final filter = filters[index];
                final bool isSelected = selectedFilter == filter;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                    widget.onFilterChanged(filter);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
