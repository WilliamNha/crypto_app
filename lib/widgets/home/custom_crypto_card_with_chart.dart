import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CustomCryptoCardWithChart extends StatelessWidget {
  final String logoPath;
  final String shortName;
  final String fullName;
  final double price;
  final double percent;
  final List<double> chartPriceList;

  const CustomCryptoCardWithChart({
    required this.logoPath,
    required this.shortName,
    required this.fullName,
    required this.percent,
    required this.price,
    required this.chartPriceList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      margin: const EdgeInsets.only(
        left: 20,
        top: 25,
      ),
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        //  const Color(0xffF9FAFC),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 5),
          child: Row(
            children: [
              SvgPicture.asset(
                logoPath,
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
                    fullName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    shortName,
                    style: const TextStyle(color: Colors.black45, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: SfSparkLineChart(
              width: 3,
              color: const Color(0xff3CC97C),
              axisLineWidth: 0,
              data: chartPriceList,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '+$percent',
                style: const TextStyle(
                    color: Color(0xff3CC97C),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
