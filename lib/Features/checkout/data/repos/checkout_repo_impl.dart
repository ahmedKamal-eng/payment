import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo.dart';
import 'package:payment/core/utiles/strip_service.dart';

import '../../../../core/errors/failures.dart';
import '../models/payment_intend_input_model.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntendInputModel paymentIntendInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntendInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
