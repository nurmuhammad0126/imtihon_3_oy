import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../categories_screen/screen/categories_screen.dart';
import '../widgets/category_container.dart';
import '../widgets/product_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => CategoriesV1Screen()));
              },
              child: Text(
                "Browse categories",
                style: TextStyle(fontSize: 22.w, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 248.h + 32.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CategoryContainer(
                    title: 'Speakers',
                    image:
                        'https://s3-alpha-sig.figma.com/img/f268/01ae/979bea2b7f9f71d4ff7d6b6af6276289?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FnKuWQVJYJs0l-qt-45cqwLzNL-oHW4o9MOlxdzvL-2SsXlPQuaxgMLXy-Ct1sqkeUtiHSH42yTrC58wys~1WpnN6DVJMy5PZCcg114OAUwE0TOH-wnAzD5cx4Tf4pbV3WL8Rlx83ID0JPL8dJL-9r1VSrPkNQ9aIbW68jzhLPk7b5ieGRbaiZtP5J5OSZ~pqbSxLbYlZOyxyQ45rLx5WVyGI1p0grKsQS6UcIx0vD~vOwT5Lmy86EP0kZQZ9Q2V0Za9x9LWfn9KSUO4s6Lt9D0fy68HaG5ZI48Chdr6-WH7sKu706wqP4dEYY15jXv0fOPpcwcf8QltGktTHLqwfw__',
                    number: '1200',
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "Products",
              style: TextStyle(fontSize: 22.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 20.h),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.76,
                ),
                itemBuilder: (context, index) {
                  return ProductContainer(
                    title: "Boesound 2",
                    image:
                        "https://s3-alpha-sig.figma.com/img/b01e/0751/abe400a58c835ecdda80d219b0bc6740?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=o5ScbnGarLSGUisfu0e75KgIkv9NbGWMapQ~gPULnDyvvmiOmoAfDn6hht7GZ~xWn5JIkfjFYH34cD5IQ9-yYqn6FC7Ih~oGNge~UYorznXBlAJarB7nTKGqhORcChdBzJp6Lr1WAo3pD8kopJ5wp4~WpVoovL~nvj~DoOklV7nFkr8HM85DzUjdncczklEs1IoUoEs~~CDzKqj36DVk6x4ux2dzn4MnUvS-Zjj5bjzc5JLrw~ahX~D2DK-JEGQKZz~18iIluLlgL0S1URVnT97cSHuL57v28iodLbJMFLvFW3PeBlnB6JxoDhayaEMuerC9I6-whDf16jkU9kXKxw__",
                    number: "420 \$",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
