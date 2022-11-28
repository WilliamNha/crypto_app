import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  final String? title;
  final Color? color;
  final bool isSelected;
  final int? selectIndex;
  final GestureTapCallback? onTap;
  const CustomChip(
      {Key? key,
      this.title,
      this.color,
      this.onTap,
      this.selectIndex,
      this.isSelected = false})
      : super(key: key);

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected ? AppColor.primaryColor : Colors.white,
          border: Border.all(color: AppColor.primaryColor, width: 1)),
      child: Center(
          child: Text(
        '${widget.title}',
        style: TextStyle(
          color: widget.isSelected ? Colors.white : AppColor.primaryColor,
        ),
      )),
    );
  }
}
