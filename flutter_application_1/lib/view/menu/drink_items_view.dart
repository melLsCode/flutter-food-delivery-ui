import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import '../more/my_order_view.dart';
import 'item_details_view.dart';
import 'fresh_orange_juice_details_view.dart';
import 'lemonade_details_view.dart';
import 'iced_coffee_details_view.dart';
import 'mojito_details_view.dart';

class DrinkItemsView extends StatefulWidget {
  const DrinkItemsView({super.key});

  @override
  State<DrinkItemsView> createState() => _DrinkItemsViewState();
}

class _DrinkItemsViewState extends State<DrinkItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List drinkItemsArr = [
    {
      "image": "assets/img/drink_1.png",
      "name": "Fresh Orange Juice",
      "rate": "4.8",
      "rating": "98",
      "type": "Juice Bar",
      "food_type": "Drinks"
    },
    {
      "image": "assets/img/drink_2.png",
      "name": "Lemonade",
      "rate": "4.7",
      "rating": "76",
      "type": "Cool Drinks",
      "food_type": "Drinks"
    },
    {
      "image": "assets/img/drink_3.png",
      "name": "Iced Coffee",
      "rate": "4.9",
      "rating": "120",
      "type": "Coffee House",
      "food_type": "Drinks"
    },
    {
      "image": "assets/img/drink_5.png",
      "name": "Mojito",
      "rate": "4.6",
      "rating": "54",
      "type": "Bar Specials",
      "food_type": "Drinks"
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
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Drinks",
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Drink",
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
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: drinkItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = drinkItemsArr[index] as Map? ?? {};
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {
                      Widget page;
                      switch (mObj["name"]) {
                        case "Fresh Orange Juice":
                          page = const FreshOrangeJuiceDetailsView();
                          break;
                        case "Lemonade":
                          page = const LemonadeDetailsView();
                          break;
                        case "Iced Coffee":
                          page = const IcedCoffeeDetailsView();
                          break;
                        case "Mojito":
                          page = const MojitoDetailsView();
                          break;
                        default:
                          page = const ItemDetailsView();
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page),
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
