// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:crypto_deeprooted/bloc/btc_bloc/btc_bloc.dart';
import 'package:crypto_deeprooted/bloc/btc_bloc/btc_event.dart';
import 'package:crypto_deeprooted/bloc/btc_bloc/btc_state.dart';
import 'package:crypto_deeprooted/widgets/app_search.dart';
import 'package:crypto_deeprooted/widgets/ask_bid_card_view.dart';
import 'package:crypto_deeprooted/widgets/btc_card_view.dart';
import 'package:crypto_deeprooted/widgets/expanded_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeBTC extends StatefulWidget {
  const HomeBTC({Key? key}) : super(key: key);

  @override
  _HomeBTCState createState() => _HomeBTCState();
}

class _HomeBTCState extends State<HomeBTC> {
  BTCBloc? btcBloc;
  TextEditingController searchTextController = TextEditingController();
  var searchText = "";
  var todaysDate;

  ///If the box is expanded
  bool _isExpanded = false;

  ///Toogle the box to expand or collapse
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    btcBloc = BlocProvider.of<BTCBloc>(context);
    // initalizeBTCRequestModel(searchText);
    todaysDate = DateTime.now();
    todaysDate = DateFormat("yyyy-MM-dd hh:mm:ss").format(todaysDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSearchBar(
                searchText: searchTextController,
                onPressed: () {
                  initalizeBTCRequestModel(
                      searchTextController.text.toString());
                  setState(() {});
                },
                suffixIcon: GestureDetector(
                    onTap: () {
                      searchTextController.text = "";
                    },
                    child: const Icon(Icons.close)),
              ),
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (searchTextController.text.isEmpty) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/search.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "      No Data Available",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: BlocBuilder<BTCBloc, BTCState>(
                        builder: (context, state) {
                      if (state is BTCStateInitialState) {
                        return Platform.isIOS
                            ? CupertinoActivityIndicator()
                            : CircularProgressIndicator();
                      } else if (state is BTCStateLoadingState) {
                        return Platform.isIOS
                            ? CupertinoActivityIndicator()
                            : CircularProgressIndicator();
                      } else if (state is BTCStateFetchSuccessState) {
                        return Builder(builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      searchTextController.text.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Spacer(),
                                    Text(
                                      todaysDate.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                BTCCardView(
                                    headerTextOne: "OPEN",
                                    hedaerTextTwo: "HIGH",
                                    moneyTextOne: state.btcusdResponseModel.open
                                        .toString(),
                                    moneyTextTwo: state.btcusdResponseModel.low
                                        .toString()),
                                SizedBox(
                                  height: 20,
                                ),
                                BTCCardView(
                                    headerTextOne: "LOW",
                                    hedaerTextTwo: "LAST",
                                    moneyTextOne: state.btcusdResponseModel.low
                                        .toString(),
                                    moneyTextTwo: state.btcusdResponseModel.last
                                        .toString()),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "   VOLUME",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      " ${state.btcusdResponseModel.volume}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _toogleExpand();
                                  },
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "VIEW ORDER BOOK ",
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ExpandedSection(
                                  expand: _isExpanded,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "BID PRICE ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "QTY ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "QTY ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            "ASK PRICE ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      ListView.builder(
                                          itemCount: 5,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return AskBidCardView(
                                                bidPrice: state
                                                    .btcOrderResponseModel
                                                    .bids![index][0]
                                                    .toString(),
                                                bidQTY: state
                                                    .btcOrderResponseModel
                                                    .bids![index][1]
                                                    .toString(),
                                                askPrice: state
                                                    .btcOrderResponseModel
                                                    .asks![index][1]
                                                    .toString(),
                                                askQTY: state
                                                    .btcOrderResponseModel
                                                    .bids![index][0]
                                                    .toString());
                                          })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      } else if (state is BTCStateErrorState) {
                        return Container();
                      }
                      return Scaffold();
                    }),
                  );
                }
              }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            btcBloc!
                .add(BTCEventFetchEvents(searchTextController.text.toString()));
          },
          backgroundColor: Colors.purple,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }

  void initalizeBTCRequestModel(searchText) async {
    btcBloc!.add(BTCEventFetchEvents(searchTextController.text.toString()));
  }
}
