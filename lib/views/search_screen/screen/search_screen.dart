import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h, left: 35.w, right: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(),
              SizedBox(height: 24.h),
              Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 137, 136, 136),
              ),
              SizedBox(height: 32.h),
              Text(
                "recent searches",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              RecentSearches(h1text: 'Beasund 1'),
              RecentSearches(h1text: 'Beasund 1'),
              RecentSearches(h1text: 'Beasund 1'),

              Text(
                "popular items",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),

              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
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
              SizedBox(height: 20.h), // bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
