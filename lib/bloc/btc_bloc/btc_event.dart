import 'package:equatable/equatable.dart';

class BTCEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BTCEventFetchEvents extends BTCEvent {
  String currType;
  BTCEventFetchEvents(this.currType);
}
