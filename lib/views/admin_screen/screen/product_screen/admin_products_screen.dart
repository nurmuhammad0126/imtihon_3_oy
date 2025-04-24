import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/product_model.dart';
import 'package:flutter_3_oy_imtixon/view_model/product_view_model.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/screen/product_screen/add_products.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/widgets/product_widgtes/admin_long_product_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminProductsScreen extends StatefulWidget {
  const AdminProductsScreen({super.key});

  @override
  State<AdminProductsScreen> createState() => _AdminProductsScreenState();
}

class _AdminProductsScreenState extends State<AdminProductsScreen> {
  final ProductViewModel productViewModel = ProductViewModel();

  List<ProductModel> products = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final fetchedProducts = await productViewModel.getProducts();

    setState(() {
      products = fetchedProducts ?? [];

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddProductScreen()));
        },
        child: Text(
          "+",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.h),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return AdminLongProductContainer(
                    title: product.name,
                    image: product.image,
                    number: product.price.toString(),
                    productId: product.id,
                    category: product.category,
                    onDeleted: loadData(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
