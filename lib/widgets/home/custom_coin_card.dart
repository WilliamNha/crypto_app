import 'package:crypto_tracker_app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

var homeController = Get.put(HomeController());

class CustomCoinCard extends StatelessWidget {
  final String? coinName;
  final String? coinSymbol;
  final String? price;
  final String? percentChange24h;

  const CustomCoinCard({
    this.coinName,
    this.coinSymbol,
    this.percentChange24h,
    this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgPicture.network(
            'https://logo.chainbit.xyz/$coinSymbol',
            width: 50,
            height: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                coinName!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                coinSymbol!,
                style: const TextStyle(color: Colors.black45, fontSize: 15),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$$price',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomPercentChangeCard(percentChange24h: percentChange24h),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPercentChangeCard extends StatelessWidget {
  const CustomPercentChangeCard({
    Key? key,
    required this.percentChange24h,
  }) : super(key: key);

  final String? percentChange24h;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: percentChange24h![0] == '-'
              ? Colors.red.withOpacity(0.15)
              : Colors.green.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              percentChange24h![0] == '-'
                  ? FontAwesomeIcons.caretDown
                  : FontAwesomeIcons.caretUp,
              // Icons.arrow_drop_up_rounded,
              color: percentChange24h![0] == '-' ? Colors.red : Colors.green,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text('$percentChange24h%',
                style: TextStyle(
                  fontSize: 12,
                  color:
                      percentChange24h![0] == '-' ? Colors.red : Colors.green,
                )),
          ]),
    );
  }
}
