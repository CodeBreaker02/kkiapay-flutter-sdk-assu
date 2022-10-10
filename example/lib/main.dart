import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart';
import 'package:kkiapay_flutter_sdk/utils/kkiapayConf.sample.dart';
import './successScreen.dart';

void main() => runApp(App());

void successCallback(response, context) {
  print(response);
  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SuccessScreen(
        amount: response['amount'],
        transactionId: response['transactionId'],
      ),
    ),
  );
}

final kkiapay = KKiaPay(
  amount: 100,
  phone: "22961877882",
  name: "John Doe",
  email: "email@mail.com",
  reason: 'transaction reason',
  data: 'other data',
  sandbox: true,
  apikey: '3425dc6035d711eca8f5b92f2997955b',
  callback: successCallback,
  theme: "#222F5A",
  // paymentMethod: PaymentMethod.momo or PaymentMethod.direct_debit or PaymentMethod.card
);

//=eyJhbW91bnQiOjEwMCwicGF5bWVudE1ldGhvZHMiOiJtb21vIiwic2FuZGJveCI6dHJ1ZSwia2V5IjoiMzQyNWRjNjAzNWQ3MTFlY2E4ZjViOTJmMjk5Nzk1NWIiLCJjYWxsYmFjayI6Imh0dHA6Ly9yZWRpcmVjdC5ra2lhcGF5Lm1lIiwidGhlbWUiOiIjRTMwRTI1In0=

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: nColorPrimary,
          title: Text('Kkiapay Sample'),
          centerTitle: true,
        ),
        body: KkiapaySample(),
      ),
    );
  }
}

class KkiapaySample extends StatelessWidget {
  const KkiapaySample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTheme(
            minWidth: 500.0,
            height: 100.0,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff222F5A)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                'Pay Now',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => kkiapay),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
