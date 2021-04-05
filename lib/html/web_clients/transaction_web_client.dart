import 'dart:convert';
import 'package:bytebank_web_api/html/webclient.dart';
import 'package:bytebank_web_api/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(url,
        headers: {
          'content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    switch (response.statusCode) {
      case 400:
        throw Exception('There was an error submitting transaction');
        break;
      case 401:
        throw Exception('Authentication failed');
        break;
    }
    return Transaction.fromJson(jsonDecode(response.body));
  }

  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(url).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }
}
