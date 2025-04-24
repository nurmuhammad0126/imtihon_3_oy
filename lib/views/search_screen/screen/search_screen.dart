import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/product_model.dart';
import '../../../view_model/product_view_model.dart';
import '../../../view_model/user_cart_viewmodel.dart';
import '../../home_screen/widgets/product_container.dart';

import '../../single_products/single_product_v1/screen/single_product_v1.dart';
import '../widgets/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final userCartViewModel = UserCartViewmodel();
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
                        return GestureDetector(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleProductV1(
                                    productModel: products[index],
                                  ),
                                ));
                            
                          },
                          child: ProductContainer(
                            title: products[index].name,
                            image: products[index].image,
                            number: "${products[index].price} \$",
                          ),
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
