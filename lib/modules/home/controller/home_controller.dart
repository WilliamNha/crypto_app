import 'package:crypto_tracker_app/modules/home/model/coin_model.dart';
import 'package:crypto_tracker_app/utils/helper/api_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();
  final coinDataModel = CoinDataModel().obs;
  final coinDataList = <CoinDataModel>[].obs;
  final isLoading = false.obs;

  Future getCoinData() async {
    isLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'listings/latest', methode: METHODE.get, isHasApiKey: true)
        .then((responseData) {
      var responseJson = responseData['data'];
      coinDataList.clear();
      responseJson.map((data) {
        coinDataList.add(CoinDataModel.fromJson(data));
      }).toList();

      isLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          '===========Error::${error.statusCode} +++++${error.bodyString}');
    });
    isLoading(false);
  }
}
