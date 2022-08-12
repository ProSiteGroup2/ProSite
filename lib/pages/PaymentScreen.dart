// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_string_interpolations, library_private_types_in_public_api, no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group2/globals.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:io';

class Payment extends StatefulWidget {
  final String amount;
  final String cardNumber;

  // receive data from the FirstScreen as a parameter
  Payment({required this.amount, required this.cardNumber});
  @override
  _PaymentState createState() => new _PaymentState(
        amount,
        cardNumber,
      );
}

class _PaymentState extends State<Payment> {
  late Token _paymentToken;
  late PaymentMethod _paymentMethod;
  late String _error;
  final String _currentSecret =
      "sk_test_51LRh1yA1g3LxeRvZbK0u6rkt4cp2iyL7pRqqhYRtk4sfde9fQQULyFW67VgP6sWGIN6A82oaKIRephuy0NLTP1Ap00tuqIq1U2"; //set this yourself, e.g using curl
  late PaymentIntentResult _paymentIntent;
  late Source _source;

  String amount;
  String cardNumber;
  _PaymentState(this.amount, this.cardNumber);
  int myInt = int.parse("${product['price']}");

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: "4222 2222 2222 3333",
    expMonth: 09,
    expYear: 22,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51LRh1yA1g3LxeRvZTQSjApuwK0JjVDBUm32BzFJu4Y1r1cQZhTbGzV5WnTqfqjcmORQHhx3vdvKgnOvgIgQIA2DO00ewTfdIiI",
        merchantId: "acct_1LKO0gCYjXLJaAUh",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.lightGreen,
        title: new Text(' Select Payment Method '),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.clear),
          //   onPressed: () {
          //     setState(() {
          //       _source = null;
          //       _paymentIntent = null;
          //       _paymentMethod = null;
          //       _paymentToken = null;
          //     });
          //   },
          // )
        ],
      ),
      body: ListView(
        controller: _controller,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          RaisedButton(
            child: Text("Create Source"),
            onPressed: () {
              StripePayment.createSourceWithParams(SourceParams(
                type: 'ideal',
                card: testCard,
                amount: myInt,
                currency: 'eur',
                returnURL: 'example://stripe-redirect',
              )).then((source) {
                _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(content: Text('Received ${source.sourceId}')));
                setState(() {
                  _source = source;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          RaisedButton(
            child: Text("Create Token with Card Form"),
            onPressed: () {
              StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
                  .then((paymentMethod) {
                _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          RaisedButton(
            child: Text("Create Token with Card"),
            onPressed: () {
              StripePayment.createTokenWithCard(
                testCard,
              ).then((token) {
                _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(content: Text('Received ${token.tokenId}')));
                setState(() {
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          Divider(),
          RaisedButton(
            child: Text("Create Payment Method with Card"),
            onPressed: () {
              StripePayment.createPaymentMethod(
                PaymentMethodRequest(
                  card: testCard,
                ),
              ).then((paymentMethod) {
                _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),
          /*   RaisedButton(
            child: Text("Create Payment Method with existing token"),
            onPressed: _paymentToken == null
                ? null
                : () {
              StripePayment.createPaymentMethod(
                PaymentMethodRequest(
                  card: CreditCard(
                    token: _paymentToken.tokenId,
                  ),
                ),
              ).then((paymentMethod) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
                setState(() {
                  _paymentMethod = paymentMethod;
                });
              }).catchError(setError);
            },
          ),*/
          /*       Divider(),
          RaisedButton(
            child: Text("Confirm Payment Intent"),
            onPressed: _paymentMethod == null || _currentSecret == null
                ? null
                : () {
              StripePayment.confirmPaymentIntent(
                PaymentIntent(
                  clientSecret: _currentSecret,
                  paymentMethodId: _paymentMethod.id,
                ),
              ).then((paymentIntent) {
                _scaffoldKey.currentState
                    .showSnackBar(SnackBar(content: Text('Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),
          RaisedButton(
            child: Text("Authenticate Payment Intent"),
            onPressed: _currentSecret == null
                ? null
                : () {
              StripePayment.authenticatePaymentIntent(clientSecret: _currentSecret).then((paymentIntent) {
                _scaffoldKey.currentState
                    .showSnackBar(SnackBar(content: Text('Received ${paymentIntent.paymentIntentId}')));
                setState(() {
                  _paymentIntent = paymentIntent;
                });
              }).catchError(setError);
            },
          ),*/
          Divider(),
          RaisedButton(
            child: Text("Proceed payment"),
            onPressed: () {
              if (Platform.isIOS) {
                _controller.jumpTo(450);
              }
              StripePayment.paymentRequestWithNativePay(
                androidPayOptions: AndroidPayPaymentRequest(
                  totalPrice: "2.40",
                  currencyCode: "EUR",
                ),
                applePayOptions: ApplePayPaymentOptions(
                  countryCode: 'DE',
                  currencyCode: 'EUR',
                  items: [
                    ApplePayItem(
                      label: 'Test',
                      amount: '100',
                    )
                  ],
                ),
              ).then((token) {
                setState(() {
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text('Received ${token.tokenId}')));
                  _paymentToken = token;
                });
              }).catchError(setError);
            },
          ),
          /*   RaisedButton(
            child: Text("Complete Native Payment"),
            onPressed: () {
              StripePayment.completeNativePayRequest().then((_) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Completed successfully')));
              }).catchError(setError);
            },
          ),
          Divider(),
          Text('Current source:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_source?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current token:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentToken?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment method:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentMethod?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment intent:'),
          Text(
            JsonEncoder.withIndent('  ').convert(_paymentIntent?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current error: $_error'),*/
        ],
      ),
    );
  }
}
