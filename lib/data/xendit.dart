import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Xendit {
  final String publicKey;

  Xendit(this.publicKey);

  Future<String> createSingleUseToken(CreateSingleUseTokenParams params) async {
    final response = await http.post(
      Uri.parse('https://api.xendit.co/v2/tokens'),
      headers: {
        'Authorization': 'Bearer $publicKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(params.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> processCreditCardPayment(String token) async {
    final response = await http.post(
      Uri.parse('https://api.xendit.co/v2/credit_card_payments'),
      headers: {
        'Authorization': 'Bearer $publicKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'token': token,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }

  Future<void> processVirtualAccountPayment(String token) async {
    final response = await http.post(
      Uri.parse('https://api.xendit.co/v2/virtual_account_payments'),
      headers: {
        'Authorization': 'Bearer $publicKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'token': token,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }

  Future<PaymentStatus> getCreditCardPaymentStatus(String transactionId) async {
    final response = await http.get(
      Uri.parse('https://api.xendit.co/v2/credit_card_payments/$transactionId/status'),
      headers: {
        'Authorization': 'Bearer $publicKey',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PaymentStatus.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }

  Future<PaymentStatus> getVirtualAccountPaymentStatus(String transactionId) async {
    final response = await http.get(
      Uri.parse('https://api.xendit.co/v2/virtual_account_payments/$transactionId/status'),
      headers: {
        'Authorization': 'Bearer $publicKey',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PaymentStatus.fromJson(data);
    } else {
      throw Exception(response.body);
    }
  }
}

class CreateSingleUseTokenParams {
  final int amount;
  final String channelCode;

  CreateSingleUseTokenParams({
    required this.amount,
    required this.channelCode,
  });

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'channel_code': channelCode,
  };
}

class ProcessCreditCardPaymentParams {
  final String token;

  ProcessCreditCardPaymentParams({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
  };
}

class ProcessVirtualAccountPaymentParams {
  final String token;

  ProcessVirtualAccountPaymentParams({
    required this.token,
  });

  Map<String, dynamic> toJson() => {
    'token': token,
  };
}

class PaymentStatus {
  final String status;

  PaymentStatus({
    required this.status,
  });

  factory PaymentStatus.fromJson(Map<String, dynamic> json) => PaymentStatus(
    status: json['status'],
  );
}