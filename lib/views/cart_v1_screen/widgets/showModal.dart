import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/views/cart_v1_screen/widgets/check_out_button.dart';
import 'package:flutter_3_oy_imtixon/views/cart_v1_screen/widgets/product_card.dart';

class Showmodal extends StatelessWidget {
  const Showmodal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 512,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 180),
              child: Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Row(
                spacing: 15,
                children: [
                  Text(
                    "MyCart",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Column(
                spacing: 16,
                children: [
                  ProductCard(
                    color: "Black",
                    count: 4,
                    image:
                        "https://s3-alpha-sig.figma.com/img/b01e/0751/abe400a58c835ecdda80d219b0bc6740?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=o5ScbnGarLSGUisfu0e75KgIkv9NbGWMapQ~gPULnDyvvmiOmoAfDn6hht7GZ~xWn5JIkfjFYH34cD5IQ9-yYqn6FC7Ih~oGNge~UYorznXBlAJarB7nTKGqhORcChdBzJp6Lr1WAo3pD8kopJ5wp4~WpVoovL~nvj~DoOklV7nFkr8HM85DzUjdncczklEs1IoUoEs~~CDzKqj36DVk6x4ux2dzn4MnUvS-Zjj5bjzc5JLrw~ahX~D2DK-JEGQKZz~18iIluLlgL0S1URVnT97cSHuL57v28iodLbJMFLvFW3PeBlnB6JxoDhayaEMuerC9I6-whDf16jkU9kXKxw__",
                    price: "\$1,600",
                    title: "Beosound 1",
                  ),
                  ProductCard(
                    color: "Black",
                    count: 1,
                    image:
                        "https://s3-alpha-sig.figma.com/img/1fd7/ee7f/9d31634bea4a2a8fd3e5ab0f0d44bf5f?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=oFHqWY5uTBLNPBeN2TUwqDsPxyNZXE0Abf1BXQgC1KHb7m-AQeZBjEGPgm5Y15K0PQ7Xu5g0L2uWjA7qvJKcYCbBu57NpUqfJaAO3hK9o-u8La6g2FVxnPdRMIdjU4fX9m0l6yZcHp-f96gRaAtuwlxWLNooJwgz38eiykQySTqx6unnz805IwrAZ3a8BHSoKYtYeCvfFRZ87W3gdjgsY5PGrvRLiGIOxKOtxB6-zYSLm13IyfC-xyZS9FYoFIf2y~~qMaQBW~x4hMEHCNElWtWILoLbePZkguoJ2ocC2zJPT9Wyn~keN9CVN2VK5w~9v6IWhLAP3orwdjv4CmEnAg__",
                    price: "\$2,200",
                    title: "Beosound Balance",
                  ),
                  CheckOutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
