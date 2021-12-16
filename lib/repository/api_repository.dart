// ignore_for_file: avoid_print

import 'package:crypto_deeprooted/model/response_model/btc_order_response_model/btc_order_response_model.dart';
import 'package:crypto_deeprooted/model/response_model/btcusd_response_model.dart';
import 'package:crypto_deeprooted/repository/api_constants.dart';
import 'package:crypto_deeprooted/repository/api_provider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  // api call for the btc details api
  Future<BtcusdResponseModel?> getBTC(String currencyType) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    try {
      response = await apiProvider.get(APIConstants.btcURL + currencyType);
      print("res" + response.toString());
      return BtcusdResponseModel.fromJson(response);
    } catch (e, stacktrace) {
      print(stacktrace);
      rethrow;
    }
  }

  // api call for the order book

  Future<BtcOrderResponseModel?> getOrderBTC(String currencyType) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    try {
      response =
          await apiProvider.get(APIConstants.orderBookingURL + currencyType);
      print("res" + response.toString());
      return BtcOrderResponseModel.fromJson(response);
    } catch (e, stacktrace) {
      print(stacktrace);
      rethrow;
    }
  }
}
