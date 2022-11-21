import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  final IconData iconData;

  const CustomAppBarButton({
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xffF9FAFC)),
        child: Icon(
          iconData,
          color: Colors.black,
          size: 28,
        ),
      ),
      onTap: () {},
    );
  }
}
