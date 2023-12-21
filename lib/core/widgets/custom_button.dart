import 'package:flutter/material.dart';
import 'package:payment/core/utiles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, this.onTap, required this.text, this.isLoading = false})
      : super(key: key);
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  color: Colors.yellow,
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
