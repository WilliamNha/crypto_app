import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:flutter/material.dart';

class CustomSettingCard extends StatefulWidget {
  final String text;
  final IconData iconData;
  final bool isHasToggleButton;

  const CustomSettingCard({
    required this.text,
    required this.iconData,
    this.isHasToggleButton = false,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSettingCard> createState() => _CustomSettingCardState();
}

class _CustomSettingCardState extends State<CustomSettingCard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffF5F8FF)),
          child: Icon(
            widget.iconData,
            color: AppColor.primaryColor,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          widget.text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        widget.isHasToggleButton
            ? Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: Colors.black38,
                activeColor: AppColor.primaryColor,
              )
            : const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: Color(0xffB1B5BE),
                ),
              ),
      ]),
    );
  }
}
