import 'package:flutter/material.dart';

class CustomDepositButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  const CustomDepositButton({
    required this.iconData,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.black38,
            offset: Offset(0.2, 0.4),
            spreadRadius: 0.2,
            blurRadius: 0.2)
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: 145,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 18,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            buttonText,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
