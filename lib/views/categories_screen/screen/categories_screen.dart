
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/big_category_container.dart';
import '../widgets/bottom_modal.dart';
import '../widgets/filter_section.dart';
import '../widgets/floating_action.dart';
import '../widgets/long_product_container.dart';

class CategoriesV1Screen extends StatefulWidget {
  const CategoriesV1Screen({super.key});

  @override
  State<CategoriesV1Screen> createState() => _CategoriesV1ScreenState();
}

class _CategoriesV1ScreenState extends State<CategoriesV1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("Speakers"),
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
            titles: ["boesemant ", "boesemant 2", "boesemant "],
            images: [
              "https://s3-alpha-sig.figma.com/img/f268/01ae/979bea2b7f9f71d4ff7d6b6af6276289?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FnKuWQVJYJs0l-qt-45cqwLzNL-oHW4o9MOlxdzvL-2SsXlPQuaxgMLXy-Ct1sqkeUtiHSH42yTrC58wys~1WpnN6DVJMy5PZCcg114OAUwE0TOH-wnAzD5cx4Tf4pbV3WL8Rlx83ID0JPL8dJL-9r1VSrPkNQ9aIbW68jzhLPk7b5ieGRbaiZtP5J5OSZ~pqbSxLbYlZOyxyQ45rLx5WVyGI1p0grKsQS6UcIx0vD~vOwT5Lmy86EP0kZQZ9Q2V0Za9x9LWfn9KSUO4s6Lt9D0fy68HaG5ZI48Chdr6-WH7sKu706wqP4dEYY15jXv0fOPpcwcf8QltGktTHLqwfw__",
              "https://s3-alpha-sig.figma.com/img/f268/01ae/979bea2b7f9f71d4ff7d6b6af6276289?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FnKuWQVJYJs0l-qt-45cqwLzNL-oHW4o9MOlxdzvL-2SsXlPQuaxgMLXy-Ct1sqkeUtiHSH42yTrC58wys~1WpnN6DVJMy5PZCcg114OAUwE0TOH-wnAzD5cx4Tf4pbV3WL8Rlx83ID0JPL8dJL-9r1VSrPkNQ9aIbW68jzhLPk7b5ieGRbaiZtP5J5OSZ~pqbSxLbYlZOyxyQ45rLx5WVyGI1p0grKsQS6UcIx0vD~vOwT5Lmy86EP0kZQZ9Q2V0Za9x9LWfn9KSUO4s6Lt9D0fy68HaG5ZI48Chdr6-WH7sKu706wqP4dEYY15jXv0fOPpcwcf8QltGktTHLqwfw__",
              "https://s3-alpha-sig.figma.com/img/f268/01ae/979bea2b7f9f71d4ff7d6b6af6276289?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FnKuWQVJYJs0l-qt-45cqwLzNL-oHW4o9MOlxdzvL-2SsXlPQuaxgMLXy-Ct1sqkeUtiHSH42yTrC58wys~1WpnN6DVJMy5PZCcg114OAUwE0TOH-wnAzD5cx4Tf4pbV3WL8Rlx83ID0JPL8dJL-9r1VSrPkNQ9aIbW68jzhLPk7b5ieGRbaiZtP5J5OSZ~pqbSxLbYlZOyxyQ45rLx5WVyGI1p0grKsQS6UcIx0vD~vOwT5Lmy86EP0kZQZ9Q2V0Za9x9LWfn9KSUO4s6Lt9D0fy68HaG5ZI48Chdr6-WH7sKu706wqP4dEYY15jXv0fOPpcwcf8QltGktTHLqwfw__",
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
              itemCount: 4,
              itemBuilder: (context, index) {
                return LongProductContainer(
                  title: "fsdf",
                  image:
                      "https://s3-alpha-sig.figma.com/img/b01e/0751/abe400a58c835ecdda80d219b0bc6740?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=o5ScbnGarLSGUisfu0e75KgIkv9NbGWMapQ~gPULnDyvvmiOmoAfDn6hht7GZ~xWn5JIkfjFYH34cD5IQ9-yYqn6FC7Ih~oGNge~UYorznXBlAJarB7nTKGqhORcChdBzJp6Lr1WAo3pD8kopJ5wp4~WpVoovL~nvj~DoOklV7nFkr8HM85DzUjdncczklEs1IoUoEs~~CDzKqj36DVk6x4ux2dzn4MnUvS-Zjj5bjzc5JLrw~ahX~D2DK-JEGQKZz~18iIluLlgL0S1URVnT97cSHuL57v28iodLbJMFLvFW3PeBlnB6JxoDhayaEMuerC9I6-whDf16jkU9kXKxw__",
                  number: "1.600",
                  rating: 4,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
