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
        
    //throw Exception(); //Simular erro desconhecido

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
     throw HttpException(_statusCodeResponses[response.statusCode]);
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error submitting transaction',
    401: 'Authentication failed',
  };



  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(url);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }
}

class HttpException implements Exception{
  final String message;

  HttpException(this.message);


}