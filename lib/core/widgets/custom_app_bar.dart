import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utiles/styles.dart';

AppBar customAppBar({final String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: Center(
        child: SvgPicture.asset(
      "assets/images/Arrow 1.svg",
    )),
    title:
        Text(title ?? '', textAlign: TextAlign.center, style: Styles.style25),
  );
}
