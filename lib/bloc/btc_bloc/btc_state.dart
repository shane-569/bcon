import 'package:crypto_deeprooted/model/response_model/btc_order_response_model/btc_order_response_model.dart';
import 'package:crypto_deeprooted/model/response_model/btcusd_response_model.dart';
import 'package:equatable/equatable.dart';

class BTCState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BTCStateInitialState extends BTCState {}

class BTCStateLoadingState extends BTCState {}

// ignore: must_be_immutable
class BTCStateFetchSuccessState extends BTCState {
  BtcusdResponseModel btcusdResponseModel;
  BtcOrderResponseModel btcOrderResponseModel;
  BTCStateFetchSuccessState(
      this.btcusdResponseModel, this.btcOrderResponseModel);
}

// ignore: must_be_immutable
class BTCStateErrorState extends BTCState {
  String? message;
  BTCStateErrorState({this.message});
}
