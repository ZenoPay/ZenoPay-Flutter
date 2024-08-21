

import 'package:flutter/material.dart';
import 'zeno_pay_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ZenoPay Integration'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              createOrder(
                buyerEmail: 'customer@example.com',
                buyerName: 'John Doe',
                buyerPhone: '0752117588',
                amount: 10000,
              );
            },
            child: Text('Create Order'),
          ),
        ),
      ),
    );
  }
}