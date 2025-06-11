import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Track Order")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order summary
              Text("Wed, 12 Sep", style: TextStyle(color: Colors.grey[600], fontSize: 15)),
              const SizedBox(height: 4),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order ID: 5t36-83j4", style: TextStyle(fontWeight: FontWeight.w500)),
                  Row(
                    children: [
                      Text("Amt: ", style: TextStyle(fontWeight: FontWeight.w500)),
                      Text("345.00", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // ETA
              const Row(
                children: [
                  Text("ETA: ", style: TextStyle(fontWeight: FontWeight.w600)),
                  Text("15 Min", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 18),
              // Stepper
              _OrderStepper(),
              const SizedBox(height: 24),
              // Delivery Address
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Colors.orange[700]),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text(
                            "Home, Work & Other address\nHouse No: 1314, 2nd Floor, Purok Mangga,\nBrg, Victoria 122022, Tago, Near: Next to LIC office",
                            style: TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Rating Reminder
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: Colors.amber[700]),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Don't forget to rate", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text(
                            "Oh Terii! Kitchen to help your fellow foodies.",
                            style: TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                          SizedBox(height: 8),
                          // Replace static Row with interactive rating bar
                          _RatingBar(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step data
    final steps = [
      {
        "title": "Ready to Pickup",
        "subtitle": "Order#234562 from Tasty Food.",
        "time": "11:00",
        "icon": Icons.check_circle,
        "active": true,
      },
      {
        "title": "Order Processed",
        "subtitle": "We are preparing your order.",
        "time": "10:08",
        "icon": Icons.restaurant_menu,
        "active": false,
      },
      {
        "title": "Payment Confirmed",
        "subtitle": "Awaiting confirmation...",
        "time": "10:06",
        "icon": Icons.payment,
        "active": false,
      },
      {
        "title": "Order Placed",
        "subtitle": "We have recieved your order.",
        "time": "10:04",
        "icon": Icons.shopping_bag,
        "active": false,
      },
    ];

    return Column(
      children: List.generate(steps.length, (i) {
        final step = steps[i];
        final isLast = i == steps.length - 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  step["icon"] as IconData,
                  color: step["active"] as bool ? Colors.green : Colors.grey[400],
                  size: 28,
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 38,
                    color: Colors.grey[300],
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          step["title"] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: step["active"] as bool ? Colors.green : Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          step["time"] as String,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      step["subtitle"] as String,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

// Add this widget at the end of the file (outside NotificationsView)
class _RatingBar extends StatefulWidget {
  const _RatingBar({Key? key}) : super(key: key);

  @override
  State<_RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<_RatingBar> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: index < _rating ? Colors.amber[700] : Colors.grey[400],
            size: 22,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
        ),
      ),
    );
  }
}
