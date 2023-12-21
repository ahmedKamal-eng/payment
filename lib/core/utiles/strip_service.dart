import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/data/models/ephemeral_key/ephemeral_key.dart';
import 'package:payment/Features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment/Features/checkout/data/models/pyment_intend_model/pyment_intend_model.dart';
import 'package:payment/core/utiles/api_keys.dart';
import 'package:payment/core/utiles/api_service.dart';
import '../../Features/checkout/data/models/payment_intend_input_model.dart';
import 'package:dio/dio.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PymentIntendModel> createPaymentIntent(
      PaymentIntendInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PymentIntendModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitiPaymentSheetInputModel
          initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initiPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initiPaymentSheetInputModel.customerId,
        merchantDisplayName: 'ahmed kamal',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntendInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymentIntentInputModel.cusomerId);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.cusomerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initiPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2023-08-16',
        });

    var ephermeralKey = EphemeralKey.fromJson(response.data);

    return ephermeralKey;
  }
}

// class StripeService {
//   final ApiService apiService = ApiService();
//
//   Future<PymentIntendModel> createPaymentIntent(
//       PaymentIntendInputModel paymentIntendInputModel) async {
//     var response = await apiService.post(
//         body: paymentIntendInputModel.toJson(),
//         contentType: Headers.formUrlEncodedContentType,
//         url: 'https://api.stripe.com/v1/payment_intents',
//         token: ApiKeys.secretKey);
//     var paymentIntendModel =
//         PymentIntendModel.fromJson(response.data);
//     return paymentIntendModel;
//   }
//
//
//
//   Future initPaymentSheet({required InitiPaymentSheetInputModel initPaymentSheetInputModel}) async {
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
//         customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
//         customerId: initPaymentSheetInputModel.customerId,
//         merchantDisplayName: 'Ahmed Kamal',
//       ),
//     );
//   }
//
//   Future displayPaymentSheet() async {
//     await Stripe.instance.presentPaymentSheet();
//   }
//
//   Future makePayment(
//       {required PaymentIntendInputModel paymentIntendInputModel}) async {
//     var paymentIntentModel = await createPaymentIntent(paymentIntendInputModel);
//     var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntendInputModel.cusomerId!);
//     var initPaymentSheetInputModel =InitiPaymentSheetInputModel(clientSecret: paymentIntentModel.clientSecret!, customerId: paymentIntendInputModel.cusomerId!, ephemeralKeySecret: ephemeralKeyModel.secret!);
//     await initPaymentSheet(
//         initPaymentSheetInputModel: initPaymentSheetInputModel);
//     await displayPaymentSheet();
//   }
//
//   Future<EphemeralKey> createEphemeralKey(
//       {required String customerId}) async {
//      var response = await apiService.post(
//         body: {'customerId': customerId},
//         contentType: Headers.formUrlEncodedContentType,
//         url: 'https://api.stripe.com/v1/ephemeral_keys',
//         token: ApiKeys.secretKey,
//         headers: {
//           'Authorization': "Bearer ${ApiKeys.secretKey}",
//           'Stripe-Version': '2023-08-16'
//         });
//     var ephemeralKey = EphemeralKey.fromJson(response.data);
//     return ephemeralKey;
//   }
//
// }
