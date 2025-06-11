import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import '../more/my_order_view.dart';
import 'item_details_view.dart';

class BeverageItemsView extends StatefulWidget {
  const BeverageItemsView({super.key});

  @override
  State<BeverageItemsView> createState() => _BeverageItemsViewState();
}

class _BeverageItemsViewState extends State<BeverageItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List beverageItemsArr = [
    {
      "image": "assets/img/cat_3.png",
      "name": "Iced Tea",
      "rate": "4.7",
      "rating": "88",
      "type": "Tea House",
      "food_type": "Beverages"
    },
    {
      "image": "assets/img/cat_4.png",
      "name": "Cappuccino",
      "rate": "4.8",
      "rating": "102",
      "type": "Coffee Bar",
      "food_type": "Beverages"
    },
    {
      "image": "assets/img/cat_offer.png",
      "name": "Smoothie",
      "rate": "4.9",
      "rating": "120",
      "type": "Juice Bar",
      "food_type": "Beverages"
    },
    {
      "image": "assets/img/cat_sri.png",
      "name": "Milkshake",
      "rate": "4.6",
      "rating": "65",
      "type": "Dairy Delight",
      "food_type": "Beverages"
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
                        "Beverages",
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
                  hintText: "Search Beverage",
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
                itemCount: beverageItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = beverageItemsArr[index] as Map? ?? {};
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
