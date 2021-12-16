class BtcOrderResponseModel {
  String? timestamp;
  String? microtimestamp;
  List<dynamic>? bids;
  List<dynamic>? asks;

  BtcOrderResponseModel({
    this.timestamp,
    this.microtimestamp,
    this.bids,
    this.asks,
  });

  factory BtcOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return BtcOrderResponseModel(
      timestamp: json['timestamp'] as String?,
      microtimestamp: json['microtimestamp'] as String?,
      bids: json['bids'] as List<dynamic>?,
      asks: json['asks'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'microtimestamp': microtimestamp,
        'bids': bids,
        'asks': asks,
      };
}
