import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0, left: 32, bottom: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              left: 0,
              right: 0,
              child: Row(
                children: List.generate(
                  27,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      height: 1,
                      width: 8,
                      // color: Color(0xFFB7B7B7),
                      color: Colors.black,
                    ),
                  ),
                ),
              )

              //   Container(
              //   width: 300,
              //   decoration: ShapeDecoration(
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         width: 2,
              //         strokeAlign: BorderSide.strokeAlignCenter,
              //         color: Color(0xFFB7B7B7),
              //       ),
              //     ),
              //   ),
              // ),
              //

              ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            top: -50,
            right: 0,
            left: 0,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFD9D9D9),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
