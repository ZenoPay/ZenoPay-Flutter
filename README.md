

# Integrating ZenoPay in Flutter

## Introduction

ZenoPay provides a robust API for processing payments and creating orders. This guide walks you through integrating ZenoPay into your Flutter application, enabling you to create orders and handle payments seamlessly.

## Prerequisites

Before you start, ensure you have:

- A ZenoPay account with API credentials (API Key and Secret Key).
- Flutter installed and a Flutter project set up.
- The `http` package added to your `pubspec.yaml`.

## Step 1: Add Dependencies

Add the `http` package to your `pubspec.yaml` file to handle HTTP requests:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.15.0
```

Run `flutter pub get` to install the new dependency.

## Step 2: Configure API Constants

Store your ZenoPay credentials and endpoint URL in a Dart file. Create a file named `zeno_pay_config.dart`:

```dart
// zeno_pay_config.dart

const String zenoPayApiUrl = 'https://api.zeno.africa';
const String apiKey = 'YOUR_API_KEY';
const String secretKey = 'YOUR_SECRET_KEY';
const String accountId = 'YOUR_ACCOUNT_ID';
```

Replace the placeholder values with your actual API credentials.

## Step 3: Create Order Function

Implement the function to create an order using the ZenoPay API. Add this to a Dart file, such as `zeno_pay_service.dart`:

```dart
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
```

## Step 4: Use the Create Order Function

You can now use the `createOrder` function in your Flutter widgets. For example, you can create a button that triggers the order creation:

```dart
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
```

## Step 5: Error Handling

For better error handling, you might want to implement logging or user notifications. Consider integrating packages like `logger` for logging or using `SnackBar` to notify users of errors.

## Advanced: Handling Responses and Payment Status

To handle responses and payment status updates, you might need to:

- Parse JSON responses.
- Implement retry logic for network issues.
- Handle webhooks if ZenoPay supports them for payment status updates.

For webhooks, refer to the ZenoPay documentation and set up a server endpoint to process incoming webhook notifications.

