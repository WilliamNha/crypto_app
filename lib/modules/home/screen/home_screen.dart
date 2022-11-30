import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:crypto_tracker_app/modules/home/model/crypto_card_model.dart';
import 'package:crypto_tracker_app/widgets/home/custom_coin_card.dart';
import 'package:crypto_tracker_app/widgets/home/custom_crypto_card_with_chart.dart';
import 'package:crypto_tracker_app/widgets/home/custom_deposit_button.dart';
import 'package:crypto_tracker_app/widgets/home/custom_notification_button.dart';
import 'package:crypto_tracker_app/widgets/home/custom_portfolio_card.dart';
import 'package:crypto_tracker_app/widgets/home/custom_section_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // debugPrint("home controller ${homeController.coinModel.value}");
    super.initState();
  }

  var isRefresh = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Center(
          child: Text(
            'Cryptovest',
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
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
      body: Obx(() => Stack(
            children: [
              (homeController.isLoading.value)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        homeController.getCoinData();
                      },
                      child: Container(
                        color: const Color(0xffF9FAFC),
                        width: double.infinity,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Stack(
                            children: [
                              Column(
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
                                            .map((data) =>
                                                CustomCryptoCardWithChart(
                                                    logoPath: data.logoPath!,
                                                    shortName: data.shortName!,
                                                    fullName: data.fullName!,
                                                    percent: data.percent!,
                                                    price: data.price!,
                                                    chartPriceList:
                                                        data.chartPriceList!))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  const CustomSectionTitle(
                                    title: 'Matket Lastest',
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: ((context, index) {
                                      return CustomCoinCard(
                                        coinName: homeController
                                            .coinDataList[index].name!,
                                        coinSymbol: homeController
                                            .coinDataList[index].symbol!,
                                        price: homeController
                                            .coinDataList[index]
                                            .quote!
                                            .uSD!
                                            .price!
                                            .toStringAsFixed(2),
                                        percentChange24h: homeController
                                            .coinDataList[index]
                                            .quote!
                                            .uSD!
                                            .percentChange24h!
                                            .toStringAsFixed(2),
                                      );
                                    }),
                                    itemCount: 10,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }
}
