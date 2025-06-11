import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import '../more/my_order_view.dart';
import 'item_details_view.dart';

class FoodItemsView extends StatefulWidget {
  const FoodItemsView({super.key});

  @override
  State<FoodItemsView> createState() => _FoodItemsViewState();
}

class _FoodItemsViewState extends State<FoodItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List foodItemsArr = [
    {
      "image": "assets/img/item_1.png",
      "name": "Grilled Chicken",
      "rate": "4.8",
      "rating": "210",
      "type": "BBQ House",
      "food_type": "Food"
    },
    {
      "image": "assets/img/item_2.png",
      "name": "Veggie Pizza",
      "rate": "4.7",
      "rating": "180",
      "type": "Pizza Place",
      "food_type": "Food"
    },
    {
      "image": "assets/img/item_3.png",
      "name": "Beef Burger",
      "rate": "4.9",
      "rating": "250",
      "type": "Burger Joint",
      "food_type": "Food"
    },
    {
      "image": "assets/img/cat_3.png",
      "name": "Pasta Alfredo",
      "rate": "4.6",
      "rating": "95",
      "type": "Italiano",
      "food_type": "Food"
    },
   
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
                        "Food",
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
                  hintText: "Search Food",
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
                itemCount: foodItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = foodItemsArr[index] as Map? ?? {};
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
