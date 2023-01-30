import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> collectPayment(String userId, double amount) async {
  final double serviceFee = amount * 0.05;
  final double totalAmount = amount + serviceFee;

  final String url = "https://example.com/charge";
  final String apiKey = "sk_test_123456";

  final Map<String, String> headers = {
    "Authorization": "Bearer $apiKey",
    "Content-Type": "application/json"
  };

  final Map<String, dynamic> data = {
    "user_id": userId,
    "amount": totalAmount
  };

  final http.Response response = await http.post(url, headers: headers, body: jsonEncode(data));

  return jsonDecode(response.body);
}

void main() async {
  final Map<String, dynamic> response = await collectPayment("user_123", 100);
  print(response);
}
