import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

import 'my_order_view.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  List inboxArr = [
    {
      "title": "Order Delivered",
      "detail":
          "Your recent order has been delivered successfully. We hope you enjoyed your meal! Please rate your experience.",
    },
    {
      "title": "Special Offer Just for You",
      "detail":
          "Enjoy 20% off on your next order. Use code FOODIE20 at checkout. Limited time only!",
    },
    {
      "title": "Order Confirmation",
      "detail":
          "Thank you for your order! We are preparing your food and will notify you once it’s on the way.",
    },
    {
      "title": "MealMonkey Updates",
      "detail":
          "We have updated our app to serve you better. Check out the new features and improvements.",
    },
    {
      "title": "Referral Bonus",
      "detail":
          "Invite your friends and earn rewards! Share your referral code and get discounts on your next order.",
    },
    {
      "title": "Order Cancelled",
      "detail":
          "Your recent order has been cancelled as per your request. If you have any questions, contact our support.",
    },
    {
      "title": "Payment Successful",
      "detail":
          "Your payment has been processed successfully. Thank you for choosing MealMonkey.",
    },
    {
      "title": "Delivery Update",
      "detail":
          "Your order is on the way! Track your delivery in real-time from the app.",
    },
    {
      "title": "Account Security",
      "detail":
          "Your account password was changed recently. If this wasn’t you, please contact support immediately.",
    },
    {
      "title": "Feedback Request",
      "detail":
          "We value your feedback. Let us know how we can improve your MealMonkey experience.",
    },
    {
      "title": "Loyalty Program",
      "detail":
          "You’ve earned new loyalty points! Redeem them for exclusive discounts and offers.",
    },
    {
      "title": "Seasonal Promotion",
      "detail":
          "Celebrate the season with special menu items and discounts. Order now and enjoy!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        "Inbox",
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
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: inboxArr.length,
                separatorBuilder: ((context, index) => Divider(
                      indent: 25,
                      endIndent: 25,
                      color: TColor.secondaryText.withOpacity(0.4),
                      height: 1,
                    )),
                itemBuilder: ((context, index) {
                  var cObj = inboxArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(
                        color:
                            index % 4 != 1 ? TColor.white : TColor.textfield),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj["title"].toString(),
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["detail"].toString(),
                                maxLines: 2,
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
