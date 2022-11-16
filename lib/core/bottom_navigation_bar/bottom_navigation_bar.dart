import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:crypto_tracker_app/modules/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var currentIndex = 0;
  List<Widget> widgetOption = [
    const HomeScreen(),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: widgetOption.elementAt(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: const Color(0xffA2A7B2),
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 18,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: CustomActiveBottomBarItem(
                  iconData: FontAwesomeIcons.houseChimneyWindow,
                  buttonText: 'Home',
                ),
                icon: Icon(
                  FontAwesomeIcons.houseChimneyWindow,
                ),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                activeIcon: CustomActiveBottomBarItem(
                  iconData: FontAwesomeIcons.arrowRightArrowLeft,
                  buttonText: 'Transaction',
                ),
                icon: Icon(
                  FontAwesomeIcons.arrowRightArrowLeft,
                ),
                label: 'Transaction',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                activeIcon: CustomActiveBottomBarItem(
                  iconData: FontAwesomeIcons.arrowTrendUp,
                  buttonText: 'History',
                ),
                icon: Icon(
                  FontAwesomeIcons.arrowTrendUp,
                ),
                label: 'Search',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                activeIcon: CustomActiveBottomBarItem(
                  iconData: FontAwesomeIcons.user,
                  buttonText: 'User',
                ),
                icon: Icon(
                  FontAwesomeIcons.user,
                ),
                label: 'User',
                backgroundColor: Colors.blue),
          ],
        ));
  }
}

class CustomActiveBottomBarItem extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final double padding;
  const CustomActiveBottomBarItem({
    required this.iconData,
    required this.buttonText,
    this.padding = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(left: padding),
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.primaryColor),
            child: Icon(
              iconData,
              size: 17,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          buttonText,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
        )
      ],
    );
  }
}

// List<IconData> listOfIcons = [
//   Icons.home_rounded,
//   Icons.shopping_cart,
//   Icons.local_shipping,
//   Icons.wallet,
//   Icons.account_circle_outlined,
// ];

// List<String> listOfStrings = [
//   'Home',
//   'Cart',
//   'Orders',
//   'Wellet',
//   'Account',
// ];
