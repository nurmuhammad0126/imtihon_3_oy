import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const FilterBottomSheet(),
    );
  }
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int _selectedGender = 2; // 0=Men, 1=Women, 2=Both
  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  final List<bool> _selectedColors = [true, true, true, true, true];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
  ];

  int get _activeFilterCount {
    int count = 0;
    if (_selectedGender != 2) count++;
    if (_minPriceController.text.isNotEmpty || _maxPriceController.text.isNotEmpty) count++;
    if (_selectedColors.contains(false)) count++;
    return count;
  }

  void _resetFilters() {
    setState(() {
      _selectedGender = 2;
      _minPriceController.clear();
      _maxPriceController.clear();
      for (int i = 0; i < _selectedColors.length; i++) {
        _selectedColors[i] = true;
      }
    });
  }

  void _applyFilters() {
    final filters = {
      'gender': _selectedGender == 0
          ? 'Men'
          : _selectedGender == 1
              ? 'Women'
              : 'Both',
      'minPrice': _minPriceController.text.isNotEmpty
          ? double.tryParse(_minPriceController.text)
          : null,
      'maxPrice': _maxPriceController.text.isNotEmpty
          ? double.tryParse(_maxPriceController.text)
          : null,
      'colors': [
        if (_selectedColors[0]) 'Red',
        if (_selectedColors[1]) 'Blue',
        if (_selectedColors[2]) 'Green',
        if (_selectedColors[3]) 'Yellow',
        if (_selectedColors[4]) 'Purple',
      ],
    };
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.h),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Header
            Text(
              'SPEAKERS',
              style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.h),

            // Gender Section
            _buildSectionHeader('Gender'),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildGenderChip('Men', 0),
                _buildGenderChip('Women', 1),
                _buildGenderChip('Both', 2),
              ],
            ),
            SizedBox(height: 24.h),

            _buildSectionHeader('Price Range'),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minPriceController,
                    decoration: InputDecoration(
                      hintText: 'Min',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text('-', style: TextStyle(fontSize: 16.sp)),
                ),
                Expanded(
                  child: TextField(
                    controller: _maxPriceController,
                    decoration: InputDecoration(
                      hintText: 'Max',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Color Section
            _buildSectionHeader('Color'),
            SizedBox(height: 12.h),
            Wrap(
              spacing: 12.w,
              children: List.generate(
                _colors.length,
                (index) => _buildColorChip(_colors[index], index),
              ),
            ),
            SizedBox(height: 32.h),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _resetFilters,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'RESET',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'APPLY FILTERS ($_activeFilterCount)',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.h,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _buildGenderChip(String label, int value) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedGender == value,
      onSelected: (selected) {
        setState(() {
          _selectedGender = selected ? value : 2;
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      labelStyle: TextStyle(
        fontSize: 14.h,
        color: _selectedGender == value ? Colors.white : Colors.black,
      ),
      selectedColor: Colors.blue,
    );
  }

  Widget _buildColorChip(Color color, int index) {
    return ChoiceChip(
      label: Text(''),
      selected: _selectedColors[index],
      onSelected: (selected) {
        setState(() {
          _selectedColors[index] = selected;
        });
      },
      backgroundColor: color.withOpacity(0.2),
      selectedColor: color,
      shape: CircleBorder(),
      padding: EdgeInsets.all(10.w),
    );
  }
}
