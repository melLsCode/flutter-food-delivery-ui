import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import '../more/my_order_view.dart';
import 'item_details_view.dart';

class PromotionItemsView extends StatefulWidget {
  const PromotionItemsView({super.key});

  @override
  State<PromotionItemsView> createState() => _PromotionItemsViewState();
}

class _PromotionItemsViewState extends State<PromotionItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List promotionItemsArr = [
    {
      "image": "assets/img/offer_1.png",
      "name": "Buy 1 Get 1 Free",
      "rate": "5.0",
      "rating": "300",
      "type": "Promo House",
      "food_type": "Promotions"
    },
    {
      "image": "assets/img/offer_2.png",
      "name": "20% Off Pizza",
      "rate": "4.8",
      "rating": "150",
      "type": "Pizza Place",
      "food_type": "Promotions"
    },
    {
      "image": "assets/img/offer_3.png",
      "name": "Free Drink with Meal",
      "rate": "4.9",
      "rating": "200",
      "type": "Burger Joint",
      "food_type": "Promotions"
    },
    // ...add more promotion items as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png", width: 20, height: 20),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Promotions",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Promotion",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: promotionItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = promotionItemsArr[index] as Map? ?? {};
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ItemDetailsView()),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
