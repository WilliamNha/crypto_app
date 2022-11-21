import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:flutter/material.dart';

class CustomPortfolioCard extends StatelessWidget {
  const CustomPortfolioCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Portfolio',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 22),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white60,
                    )),
                padding: const EdgeInsets.all(3),
                child: const Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, right: 25, left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$3500.00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '+5%',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 22),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
