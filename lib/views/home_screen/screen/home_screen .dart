import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import '../../../view_model/category_view_model.dart';
import '../../../view_model/product_view_model.dart';
import '../../categories_screen/screen/categories_screen.dart';
import '../../single_products/single_product_v1/screen/single_product_v1.dart';
import '../widgets/category_container.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/product_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductViewModel productViewModel = ProductViewModel();
  final CategoryViewModel categoryViewModel = CategoryViewModel();

  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final fetchedProducts = await productViewModel.getProducts();
    final fetchedCategories = await categoryViewModel.getCategories();

    setState(() {
      products = fetchedProducts ?? [];
      categories = fetchedCategories ?? [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 35.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Browse categories",
                      style: TextStyle(
                          fontSize: 22.w, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 248.h + 32.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoriesV1Screen(
                                          category: category)));
                            },
                            child: CategoryContainer(
                              category: category,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CategoriesV1Screen(
                                                category: category)));
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Products",
                      style: TextStyle(
                          fontSize: 22.w, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20.h),
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.76,
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
                        // return ProductContainer(
                        //   title: products[index].name,
                        //   image: products[index].image,
                        //   number: "${products[index].price} \$",
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
