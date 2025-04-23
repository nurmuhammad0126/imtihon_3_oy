import 'package:flutter/material.dart';

import '../widgets/check_out_button.dart';
import '../widgets/product_card.dart';
import '../widgets/showModal.dart';

class CartV1Screen extends StatelessWidget {
  const CartV1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 35,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        title: Text(
          "MY CART",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 35,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            width: double.infinity,
            height: 550,
            color: Colors.white,
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
                Spacer(),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$ 9,800",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => Showmodal(),
                    );
                  },
                  child: CheckOutButton(onTap: (){},),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
