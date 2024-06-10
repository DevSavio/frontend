import 'package:flutter/material.dart';

import '../constants/size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onSimpleTapped;

  const CustomButton(
      {super.key, required this.text, required this.onSimpleTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSimpleTapped();
      },
      child: Container(
        width: sizeW * 0.1715,
        height: sizeH * 0.05,
        margin: const EdgeInsets.symmetric(vertical: sizeH * 0.005),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 0,
              child: Container(
                width: sizeW * 0.13785,
                height: sizeH * 0.05,
                decoration: BoxDecoration(
                  color: const Color(0xFF174DC8),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Positioned(
              left: 78,
              top: 16,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
