import 'package:crypto_tracker_app/modules/home/model/crypto_card_model.dart';
import 'package:crypto_tracker_app/widgets/home/custom_coin_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var isSwitchClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction',
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
      body: Container(
        color: const Color(0xffF9FAFC),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              //gain lose card
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                height: 165,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(

                                // color: Colors.blue,
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            )),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Current value',
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$3500.50',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 100,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        Expanded(
                            child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Total money invested',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$4025',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ]),
                        )),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Gain/Lose',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Spacer(),
                          CustomPercentChangeCard(percentChange24h: '-15.2')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //price alert card
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Portfolio price alert',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      Switch(
                        value: isSwitchClicked,
                        onChanged: (value) {
                          setState(() {
                            isSwitchClicked = !isSwitchClicked;
                          });
                        },
                        activeTrackColor: Colors.blue,
                        activeColor: Colors.white,
                      ),
                    ]),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return CustomCoinCard(
                    coinName: cardWithChartModelList[index].fullName!,
                    coinSymbol: cardWithChartModelList[index].shortName!,
                    price: cardWithChartModelList[index].price.toString(),
                    percentChange24h:
                        cardWithChartModelList[index].percent.toString(),
                  );
                }),
                itemCount: cardWithChartModelList.length,
              ),
              SizedBox(
                height: 20,
              ),
            ])),
      ),
    );
  }
}
