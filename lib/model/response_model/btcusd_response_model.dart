class BtcusdResponseModel {
  String? volume;
  String? last;
  String? timestamp;
  String? bid;
  String? vwap;
  String? high;
  String? low;
  String? ask;
  double? open;

  BtcusdResponseModel({
    this.volume,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.high,
    this.low,
    this.ask,
    this.open,
  });

  factory BtcusdResponseModel.fromJson(Map<String, dynamic> json) {
    return BtcusdResponseModel(
      volume: json['volume'] as String?,
      last: json['last'] as String?,
      timestamp: json['timestamp'] as String?,
      bid: json['bid'] as String?,
      vwap: json['vwap'] as String?,
      high: json['high'] as String?,
      low: json['low'] as String?,
      ask: json['ask'] as String?,
      open: (json['open'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'volume': volume,
        'last': last,
        'timestamp': timestamp,
        'bid': bid,
        'vwap': vwap,
        'high': high,
        'low': low,
        'ask': ask,
        'open': open,
      };
}
