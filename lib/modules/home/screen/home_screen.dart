import 'package:crypto_tracker_app/widgets/home/custom_deposit_button.dart';
import 'package:crypto_tracker_app/widgets/home/custom_notification_button.dart';
import 'package:crypto_tracker_app/widgets/home/custom_portfolio_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      margin: const EdgeInsets.only(
                        left: 20,
                        top: 25,
                      ),
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffF9FAFC),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/crypto_logo/bitcoin.svg',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'BTC',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Bitcoin',
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 25),
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffF9FAFC),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 25),
                      width: 180,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffF9FAFC),
                      ),
                    ),
                  ],
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

class CustomSectionTitle extends StatelessWidget {
  final String title;

  const CustomSectionTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text(
            'View all',
            style: TextStyle(color: Colors.black45, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
