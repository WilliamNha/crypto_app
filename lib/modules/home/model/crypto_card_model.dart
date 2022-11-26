class CryptoCardModel {
  final String? logoPath;
  final String? shortName;
  final String? fullName;
  final double? price;
  final double? percent;
  final List<double>? chartPriceList;
  const CryptoCardModel({
    this.chartPriceList,
    this.fullName,
    this.logoPath,
    this.percent,
    this.price,
    this.shortName,
  });
}

List<CryptoCardModel> cardWithChartModelList = [
  const CryptoCardModel(
    logoPath: 'assets/svg/crypto_logo/bitcoin.svg',
    fullName: 'Bitcoin',
    shortName: 'BTC',
    price: 203,
    percent: 0.2,
    chartPriceList: [
      5,
      6,
      5,
      7,
      3,
      5,
      6,
      5,
    ],
  ),
  const CryptoCardModel(
    logoPath: 'assets/svg/crypto_logo/ethereum.svg',
    fullName: 'Ethereum',
    shortName: 'ETH',
    price: 320,
    percent: 0.4,
    chartPriceList: [
      6,
      5,
      4,
      7,
      4,
      6,
      4,
      3,
    ],
  ),
  const CryptoCardModel(
    logoPath: 'assets/svg/crypto_logo/bnb.svg',
    fullName: 'BNB',
    shortName: 'BNB',
    price: 120,
    percent: 0.1,
    chartPriceList: [
      4,
      6,
      5,
      3,
      4,
      2,
      6,
      7,
    ],
  ),
  const CryptoCardModel(
    logoPath: 'assets/svg/crypto_logo/dogecoin.svg',
    fullName: 'Dogecoin',
    shortName: 'DOGE',
    price: 90,
    percent: 0.8,
    chartPriceList: [
      3,
      6,
      5,
      7,
      3,
      4,
      6,
      5,
    ],
  ),
];
