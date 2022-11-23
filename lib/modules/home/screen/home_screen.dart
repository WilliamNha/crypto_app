import 'package:crypto_tracker_app/modules/home/model/crypto_card_with_chart_model.dart';
import 'package:crypto_tracker_app/widgets/home/custom_crypto_card_with_chart.dart';
import 'package:crypto_tracker_app/widgets/home/custom_deposit_button.dart';
import 'package:crypto_tracker_app/widgets/home/custom_notification_button.dart';
import 'package:crypto_tracker_app/widgets/home/custom_portfolio_card.dart';
import 'package:crypto_tracker_app/widgets/home/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

final List<ChartData> chartData = [
  ChartData(2010, 35),
  ChartData(2011, 13),
  ChartData(2012, 34),
  ChartData(2013, 27),
  ChartData(2014, 40)
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Center(
          child: Text(
            'GoCrypto',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        titleSpacing: 0,
        leadingWidth: 200,
        actions: const [
          CustomAppBarButton(
            iconData: Icons.search,
          ),
          SizedBox(
            width: 30,
          ),
          CustomAppBarButton(
            iconData: Icons.notifications_outlined,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 230,
                width: double.infinity,
                child: Stack(
                  children: const [
                    CustomPortfolioCard(),
                    Positioned(
                      bottom: 0,
                      left: 40,
                      child: CustomDepositButton(
                        iconData: FontAwesomeIcons.download,
                        buttonText: 'Deposit',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 40,
                      child: CustomDepositButton(
                        iconData: FontAwesomeIcons.upload,
                        buttonText: 'Withdraw',
                      ),
                    ),
                  ],
                ),
              ),
              const CustomSectionTitle(
                title: 'Portfolio ',
              ),
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: cardWithChartModelList
                        .map((data) => CustomCryptoCardWithChart(
                            logoPath: data.logoPath!,
                            shortName: data.shortName!,
                            fullName: data.fullName!,
                            percent: data.percent!,
                            price: data.price!,
                            chartPriceList: data.chartPriceList!))
                        .toList(),
                    // children: [
                    //   const CustomCryptoCardWithChart(
                    //     logoPath: 'assets/svg/crypto_logo/bitcoin.svg',
                    //     fullName: 'Bitcoin',
                    //     shortName: 'BTC',
                    //     price: 203,
                    //     percent: 0.2,
                    //     chartPriceList: [
                    //       5,
                    //       6,
                    //       5,
                    //       7,
                    //       3,
                    //       5,
                    //       6,
                    //       5,
                    //     ],
                    //   ),
                    //   Container(
                    //     margin: const EdgeInsets.only(left: 20, top: 25),
                    //     width: 180,
                    //     height: 220,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: const Color(0xffF9FAFC),
                    //     ),
                    //   ),
                    //   Container(
                    //     margin: const EdgeInsets.only(left: 20, top: 25),
                    //     width: 180,
                    //     height: 220,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: const Color(0xffF9FAFC),
                    //     ),
                    //   ),
                    // ],
                  ),
                ),
              ),
              const CustomSectionTitle(
                title: 'Market Trend ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
