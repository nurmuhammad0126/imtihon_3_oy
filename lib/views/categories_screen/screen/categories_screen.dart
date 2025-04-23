import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/category_model.dart';
import 'package:flutter_3_oy_imtixon/models/simple_product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  List<SimpleProductModel> products = [];
  @override
  void initState() {
    super.initState();
    category = widget.category;
    products = widget.category.products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(category.name),
        actions: [
          IconButton(
            onPressed: () {
              FilterBottomSheet.show(context);
            },
            icon: Icon(Icons.tune),
          ),
        ],
      ),
      body: Column(
        children: [
          BigCategoryContainer(
            titles: [category.name, "boesemant 2", "boesemant "],
            images: [
              category.image,
              category.image,
              category.image,
            ],
            numbers: [
              "Innovative, wireless home speaker",
              "Innovative, wireless home speaker",
              "Innovative, wireless home speaker",
            ],
          ),
          FilterChipsSection(),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return LongProductContainer(
                  title: products[index].name,
                  image: products[index].image.toString(),
                  number: products[index].price.toString(),
                  rating: products[index].rating,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
