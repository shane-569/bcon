// ignore_for_file: override_on_non_overriding_member

import 'package:crypto_deeprooted/bloc/btc_bloc/btc_event.dart';
import 'package:crypto_deeprooted/bloc/btc_bloc/btc_state.dart';
import 'package:crypto_deeprooted/model/response_model/btc_order_response_model/btc_order_response_model.dart';
import 'package:crypto_deeprooted/model/response_model/btcusd_response_model.dart';
import 'package:crypto_deeprooted/repository/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BTCBloc extends Bloc<BTCEvent, BTCState> {
  Repository repository = Repository();
  BTCBloc(BTCState initialState, this.repository) : super(initialState);

  @override
  Stream<BTCState> mapEventToState(BTCEvent event) async* {
    if (event is BTCEventFetchEvents) {
      yield BTCStateLoadingState();
      try {
        late BtcusdResponseModel? result1;
        late BtcOrderResponseModel? result2;

        await Future.wait([
          repository.getBTC(event.currType).then((value) => result1 = value!),
          repository
              .getOrderBTC(event.currType)
              .then((values) => result2 = values!)
        ]);

        yield BTCStateFetchSuccessState(result1!, result2!);
      } catch (e, stacktrace) {
        yield BTCStateErrorState();
      }
    }
  }
}
