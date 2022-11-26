class CoinDataModel {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? cmcRank;
  int? numMarketPairs;
  num? circulatingSupply;
  num? totalSupply;
  num? maxSupply;
  String? lastUpdated;
  String? dateAdded;
  List<String>? tags;
  Quote? quote;

  CoinDataModel(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.cmcRank,
      this.numMarketPairs,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.lastUpdated,
      this.dateAdded,
      this.tags,
      this.quote});

  CoinDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmc_rank'];
    numMarketPairs = json['num_market_pairs'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    lastUpdated = json['last_updated'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();

    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['cmc_rank'] = cmcRank;
    data['num_market_pairs'] = numMarketPairs;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['last_updated'] = lastUpdated;
    data['date_added'] = dateAdded;
    data['tags'] = tags;

    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? uSD;
  BTC? bTC;
  BTC? eTH;

  Quote({this.uSD, this.bTC, this.eTH});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    bTC = json['BTC'] != null ? BTC.fromJson(json['BTC']) : null;
    eTH = json['ETH'] != null ? BTC.fromJson(json['ETH']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (bTC != null) {
      data['BTC'] = bTC!.toJson();
    }
    if (eTH != null) {
      data['ETH'] = eTH!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? volume24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? marketCap;
  String? lastUpdated;

  USD(
      {this.price,
      this.volume24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.marketCap,
      this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    marketCap = json['market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class BTC {
  int? price;
  int? volume24h;
  int? percentChange1h;
  int? percentChange24h;
  int? percentChange7d;
  int? marketCap;
  String? lastUpdated;

  BTC(
      {this.price,
      this.volume24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.marketCap,
      this.lastUpdated});

  BTC.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    marketCap = json['market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
