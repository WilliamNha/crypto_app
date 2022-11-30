import 'dart:convert';

import 'package:crypto_tracker_app/modules/home/model/coin_model.dart';
import 'package:crypto_tracker_app/utils/helper/api_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();
  final coinDataModel = CoinDataModel().obs;
  final coinDataList = <CoinDataModel>[].obs;
  final isLoading = false.obs;

  Future getCoinData() async {
    String url =
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
    isLoading(true);
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CMC_PRO_API_KEY': '34e0179c-1835-4a5e-bdd6-de331748bdb0',
      }).then((responseData) {
        var responseJson = json.decode(responseData.body)['data'];
        if (responseData.statusCode == 200) {
          coinDataList.clear();
          responseJson.map((data) {
            coinDataList.add(CoinDataModel.fromJson(data));
          }).toList();
          isLoading(false);
        }
      });
    } catch (e) {
      debugPrint('error ====== $e');
    } finally {
      isLoading(false);
    }
  }
}
