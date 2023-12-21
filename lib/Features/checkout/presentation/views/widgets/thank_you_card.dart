import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_info_item.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:payment/core/utiles/styles.dart';

import 'card_info_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 66,
          ),
          Text('Thank you!',
              textAlign: TextAlign.center, style: Styles.style25),
          Text('Your transaction was successful',
              textAlign: TextAlign.center, style: Styles.style20),
          SizedBox(height: 42),
          PaymentItemInfo(
            title: 'Date',
            value: '01/24/2023',
          ),
          SizedBox(
            height: 20,
          ),
          PaymentItemInfo(
            title: 'Time',
            value: '10:15 AM',
          ),
          SizedBox(
            height: 20,
          ),
          PaymentItemInfo(
            title: 'To',
            value: 'Sam Louis',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 60,
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TotalPrice(title: 'Total', value: '50.97'),
          ),
          SizedBox(
            height: 25,
          ),
          CardInfoWidget(),
          const SizedBox(
            height: 87,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: SvgPicture.asset('assets/images/iconCarrier.svg'),
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                width: 113,
                height: 58,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'PAID',
                    style: TextStyle(
                      color: Color(0xFF34A853),
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
