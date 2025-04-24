import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/category_model.dart';
import '../../../models/simple_product_model.dart';
import '../../single_products/single_product_v1/screen/single_product_v1.dart';
import '../widgets/big_category_container.dart';
import '../widgets/bottom_modal.dart';
import '../widgets/filter_section.dart';
import '../widgets/floating_action.dart';
import '../widgets/long_product_container.dart';

class CategoriesV1Screen extends StatefulWidget {
  final CategoryModel category;
  const CategoriesV1Screen({super.key, required this.category});

  @override
  State<CategoriesV1Screen> createState() => _CategoriesV1ScreenState();
}

class _CategoriesV1ScreenState extends State<CategoriesV1Screen> {
  late CategoryModel category;
  late List<SimpleProductModel> originalProducts;
  List<SimpleProductModel> filteredProducts = [];
  String currentChipFilter = 'View all';
  Map<String, dynamic> currentSheetFilters = {
    'gender': 'Both',
    'minPrice': null,
    'maxPrice': null,
    'minRating': 0.0,
    'colors': ['Red', 'Blue', 'Green', 'Yellow', 'Purple'],
  };

  @override
  void initState() {
    super.initState();
    category = widget.category;
    originalProducts = widget.category.products;
    filteredProducts = List.from(originalProducts);
    _applyAllFilters();
  }

  void _applyChipFilter(String filter) {
    setState(() {
      currentChipFilter = filter;
      _applyAllFilters();
    });
  }

  void _applyProductFilters(Map<String, dynamic> filters) {
    setState(() {
      currentSheetFilters = filters;
      _applyAllFilters();
    });
  }

  void _applyAllFilters() {
    List<SimpleProductModel> products = List.from(originalProducts);

    // Apply bottom sheet filters
    final gender = currentSheetFilters['gender'];
    if (gender != 'Both') {
      products = products.where((product) => product.gender == gender).toList();
    }

    final minPrice = currentSheetFilters['minPrice'];
    final maxPrice = currentSheetFilters['maxPrice'];
    if (minPrice != null) {
      products =
          products.where((product) => product.price >= minPrice).toList();
    }
    if (maxPrice != null) {
      products =
          products.where((product) => product.price <= maxPrice).toList();
    }

    final minRating = currentSheetFilters['minRating'] ?? 0.0;
    if (minRating > 0) {
      products =
          products.where((product) => product.rating >= minRating).toList();
    }

    final selectedColors = currentSheetFilters['colors'] as List<String>;
    if (selectedColors.isNotEmpty) {
      products = products
          .where((product) => selectedColors.contains(product.color))
          .toList();
    }

    // Apply chip filter
    switch (currentChipFilter) {
      case 'Best rated':
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Expensive first':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Cheapest first':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Count low':
        products.sort((a, b) => a.count.compareTo(b.count));
        break;
      case 'Count high':
        products.sort((a, b) => b.count.compareTo(a.count));
        break;
      case 'View all':
      default:
        break;
    }

    setState(() {
      filteredProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatingActionButton(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(category.name),
        actions: [
          IconButton(
            onPressed: () async {
              final filters = await showModalBottomSheet<Map<String, dynamic>>(
                context: context,
                isScrollControlled: true,
                builder: (context) => FilterBottomSheet(
                  initialFilters: currentSheetFilters,
                ),
              );
              if (filters != null) {
                _applyProductFilters(filters);
              }
            },
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
      body: Column(
        children: [
          BigCategoryContainer(
            titles: [category.name],
            images: [category.image],
          ),
          FilterChipsSection(
            onFilterChanged: _applyChipFilter,
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      'No products match your filters',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () async {
                          final productModel = ProductModel(
                              id: product.id,
                              name: product.name,
                              price: product.price,
                              category: category.name,
                              image: product.image,
                              description: "",
                              reviews: []);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleProductV1(
                                  productModel: productModel,
                                ),
                              ));
                        },
                        child: LongProductContainer(
                          title: product.name,
                          image: product.image,
                          number: "\$${product.price.toStringAsFixed(2)}",
                          rating: product.rating,
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
