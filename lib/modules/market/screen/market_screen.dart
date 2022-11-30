import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:crypto_tracker_app/widgets/home/custom_coin_card.dart';
import 'package:crypto_tracker_app/widgets/market/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int currentIndex = 0;
  var isSwitchClicked = true;
  var chipList = ['All', 'Watchlist', 'Top Gainers', 'Top Losers', 'Trending'];

  @override
  void initState() {
    // homeController.getCoinData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Market Trend',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 200,
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Obx(
          () => homeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : homeController.coinDataList.isEmpty
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 30),
                            color: const Color(0xffF9FAFC),
                            child: Center(
                                child: SvgPicture.asset(
                              'assets/svg/something_went_wrong.svg',
                              width: 100,
                              height: 200,
                              // color: AppColor.primaryColor,
                            )),
                          ),
                          Text(
                            'Sorry, Something went wrong!',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        homeController.getCoinData();
                      },
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Container(
                          color: const Color(0xffF9FAFC),
                          width: double.infinity,
                          height: double.infinity,
                          child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //market up in
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Center(
                                        child: RichText(
                                          text: const TextSpan(
                                            text: 'Market is ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'up 0.63%',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColor
                                                          .primaryColor)),
                                              TextSpan(text: ' in last 24h'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //search bar
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20),
                                      child: TextField(
                                        onChanged: (value) {},
                                        style: const TextStyle(
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.black,
                                          ),
                                          hintText: 'Search',
                                          filled: true,
                                          fillColor: AppColor.cardColor,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 20),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              // color: Colors.black,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: const BorderSide(
                                                color: Colors.black12,
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //chip selection horizontal
                                    SingleChildScrollView(
                                      padding: const EdgeInsets.only(right: 20),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children:
                                              chipList.asMap().entries.map((e) {
                                        return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentIndex = e.key;
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0, top: 15),
                                              child: CustomChip(
                                                isSelected:
                                                    currentIndex == e.key,
                                                title: e.value,
                                                color: AppColor.primaryColor,
                                              ),
                                            ));
                                      }).toList()),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    //content of chip

                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return CustomCoinCard(
                                          coinName: homeController
                                              .chipDataList[currentIndex][index]
                                              .name!,
                                          coinSymbol: homeController
                                              .chipDataList[currentIndex][index]
                                              .symbol!,
                                          price: homeController
                                              .chipDataList[currentIndex][index]
                                              .quote!
                                              .uSD!
                                              .price!
                                              .toStringAsFixed(2),
                                          percentChange24h: homeController
                                              .chipDataList[currentIndex][index]
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
                                    )
                                  ])),
                        ),
                      ),
                    ),
        ));
  }
}
