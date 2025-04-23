import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/product_model.dart';
import 'package:flutter_3_oy_imtixon/view_model/product_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home_screen/widgets/product_container.dart';
import '../widgets/recent_searches.dart';
import '../widgets/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final viewMOdel = ProductViewModel();
  List<ProductModel> products = [];
  bool isLoading = true;
  List<ProductModel> allProducts = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    final result = await viewMOdel.getProducts();
    setState(() {
      allProducts = result!;
      products = allProducts;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 60.h, left: 35.w, right: 35.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchField(onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                        products = allProducts
                            .where((product) => product.name
                                .toLowerCase()
                                .contains(searchQuery))
                            .toList();
                      });
                    }),
                    SizedBox(height: 24.h),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 137, 136, 136),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      "recent searches",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    const RecentSearches(h1text: 'Beasund 1'),
                    const RecentSearches(h1text: 'Beasund 1'),
                    const RecentSearches(h1text: 'Beasund 1'),
                    SizedBox(height: 24.h),
                    Text(
                      "popular items",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    GridView.builder(
                      itemCount: products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemBuilder: (context, index) {
                        return ProductContainer(
                          title: products[index].name,
                          image: products[index].image,
                          number: "${products[index].price} \$",
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
    );
  }
}
