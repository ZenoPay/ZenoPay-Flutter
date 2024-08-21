import 'dart:convert';
import 'package:http/http.dart' as http;
import 'zeno_pay_config.dart';

Future<void> createOrder({
  required String buyerEmail,
  required String buyerName,
  required String buyerPhone,
  required int amount,
}) async {
  final url = Uri.parse(zenoPayApiUrl);

  final orderData = {
    'create_order': 1,
    'buyer_email': buyerEmail,
    'buyer_name': buyerName,
    'buyer_phone': buyerPhone,
    'amount': amount,
    'account_id': accountId,
    'api_key': apiKey,
    'secret_key': secretKey,
  };

  try {
    final response = await http.post(
      url,
      body: orderData,
    );

    if (response.statusCode == 200) {
      print('Order created successfully: ${response.body}');
    } else {
      print('Failed to create order: ${response.body}');
    }
  } catch (e) {
    print('Error creating order: $e');
  }
}


