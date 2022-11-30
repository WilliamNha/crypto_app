import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:crypto_tracker_app/widgets/user/custom_setting_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffF9FAFC),
        child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 70, bottom: 20),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
              ),
              const Text(
                'Hiren Joshi',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      FontAwesomeIcons.crown,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Invite Friends',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Invite friends now to get \$20 each.',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'General',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              const CustomSettingCard(
                iconData: Icons.person_rounded,
                text: 'My Account',
              ),
              const CustomSettingCard(
                iconData: Icons.wallet_rounded,
                text: 'Billing/Payment',
              ),
              const CustomSettingCard(
                iconData: Icons.help_rounded,
                text: 'FAQ & Support',
              ),
              const CustomSettingCard(
                iconData: Icons.language_rounded,
                text: 'Language',
              ),
              const CustomSettingCard(
                iconData: FontAwesomeIcons.moon,
                text: 'Dark Mode',
                isHasToggleButton: true,
              ),
              const CustomSettingCard(
                iconData: Icons.input_rounded,
                text: 'Log Out',
              ),
              const SizedBox(
                height: 10,
              )
            ])),
      ),
    );
  }
}
