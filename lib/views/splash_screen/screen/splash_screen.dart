import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../sign_in_screen/screen/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final userRepo = UserRepository();

  List<String> images = [
    "https://s3-alpha-sig.figma.com/img/2c9f/4ff9/7aa6283a75527d1b8ebf0a783d9610aa?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=TNvL5ZAXo4dRb8vrreE3kDsRtsQZU1QG1RIuX70-z9m24ThuOievF0VpzF6UvqiCpXjIYDofuy5PKTUVb3inAgiRstcDc3iJzhcPC4Qw8QzO9AnZA7P90Oi9A6zTAZpPiA7FD6MG04O72AuKzliVBEBuMLa46sN1kSYpYn0I4TD26gV9ZnDJ7wpIt31aWHtyOKYDbX6-v8rDtaAW-OJ7~sl2hA4NrqKJ7qNPpjQS~5gcReBiUDG5~fRDwaXSe6CAospPlcXlHvDqpq0NpcTVBQIzn2JOUVpNZD15BwgiQX0cVprObpOy44c3jfnwPJKSndUCgoKteIZMy54XNOaoLw__",
    "https://s3-alpha-sig.figma.com/img/f268/01ae/979bea2b7f9f71d4ff7d6b6af6276289?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FnKuWQVJYJs0l-qt-45cqwLzNL-oHW4o9MOlxdzvL-2SsXlPQuaxgMLXy-Ct1sqkeUtiHSH42yTrC58wys~1WpnN6DVJMy5PZCcg114OAUwE0TOH-wnAzD5cx4Tf4pbV3WL8Rlx83ID0JPL8dJL-9r1VSrPkNQ9aIbW68jzhLPk7b5ieGRbaiZtP5J5OSZ~pqbSxLbYlZOyxyQ45rLx5WVyGI1p0grKsQS6UcIx0vD~vOwT5Lmy86EP0kZQZ9Q2V0Za9x9LWfn9KSUO4s6Lt9D0fy68HaG5ZI48Chdr6-WH7sKu706wqP4dEYY15jXv0fOPpcwcf8QltGktTHLqwfw__",
    "https://s3-alpha-sig.figma.com/img/c0b2/c55c/b588de69a5764e089877c12e0df0d365?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=cPeBOy7N8tOHTULRNCBpowfycLoFsS65Uob-U2mpd4TYjojx3aLjKpOeGtNVrbaQLLypoacwkMItvJ573RwEVBUVOQv9~cAe7XWbnaNOcsTS0P~fsc2mmUvD21yxif3NiHPr59Pqqc80hUFRr-LzYRSIG2yFoOJ1I640q3jx4fzwKntiaR9XZFz3ANBM71q0Rf9hmIlMjf9SNkzncbpqUuT~ao13sUsum9nrcTMifU8Rq5Pm~FuVNrYlbZtYPjF87~lcAEN0xID4kiP5BViyU2rZUi4rU7tLLdt0-6bmGhjOAiX-GmFmq4IbRo~RTKOSQWugDqbUYHFJFldXmc~~iQ__",
  ];

  List<String> titles = [
    "Welcome to CaStore !",
    "Best Audio Products",
    "Start Your Journey",
  ];

  List<String> subtitles = [
    "With long experience in the audio industry, we create the best quality products",
    "We bring the best sound experience to you",
    "Let's get started with the best in market",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 500.h,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 60.h,
                      left: 223.w,
                      child: CircleAvatar(
                        radius: 155.r,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    Image.network(images[index], width: 250.w),
                    Positioned(
                      top: 277.h,
                      left: -103.w,
                      child: CircleAvatar(
                        backgroundColor: const Color(
                          0xFF8F92A1,
                        ).withOpacity(0.4),
                        radius: 102.5.r,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: _currentIndex == index ? 15.w : 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: _currentIndex == index
                      ? Colors.yellow
                      : Colors.grey.withOpacity(0.5),
                ),
              );
            }),
          ),
          SizedBox(height: 40.h),
          Text(
            titles[_currentIndex],
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
            child: Text(
              subtitles[_currentIndex],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () async {
              if (_currentIndex < images.length - 1) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              }
            },
            child: Ink(
              width: 305.w,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.yellow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    _currentIndex == images.length - 1
                        ? "Finish"
                        : "Get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 12.sp,
                    ),
                  ),
                  Icon(Icons.arrow_right_alt_outlined, size: 26.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
